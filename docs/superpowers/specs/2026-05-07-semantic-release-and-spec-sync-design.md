# Semantic-Release Pipeline + Weekly Spec Sync — Design

**Date:** 2026-05-07
**Status:** Proposed
**Owner:** Giuseppe De Palma

## Goals

1. Replace the manual `Bump to X.Y.Z` + `mix hex.publish` workflow with an automated semantic-release pipeline driven by conventional commits.
2. Add a weekly cron that pulls the latest Polar OpenAPI spec, regenerates code, and opens a PR with a commit type that **truthfully reflects the SemVer impact** of the spec change (via `oasdiff` classification).
3. Bump `oapi_generator` from `~> 0.2.0` to `~> 0.4.0` (and refresh other deps) as the bootstrap change.

## Non-goals

- A separate pre-1.0 mapping for breaking changes. We accept that a `feat!: ...` commit can promote `0.x.y` → `1.0.0`. SemVer is honored unconditionally — no cheating.
- Custom release branches (`next`, `beta`, etc.). Single-branch releases off `main`.
- Test coverage / dialyzer / credo gates. Polarex is mostly generated code; CI stays focused on format + compile + test.

## Reference: pulsar-elixir pattern

We mirror the existing `../pulsar-elixir` pattern:

- `.releaserc` driving [`semantic-release`](https://github.com/semantic-release/semantic-release) via `cycjimmy/semantic-release-action`
- Two-stage release: `release.yml` creates the GitHub Release; `publish.yml` listens for `release: [created]` and pushes to Hex (clean separation, easy to re-trigger publish manually)
- mise-managed toolchain via `.mise.toml` + `jdx/mise-action@v2`
- Dependabot opening `chore(deps)` PRs that flow through the same pipeline

The new piece — `sync-spec.yml` — has no analog in pulsar; it's the polarex-specific addition.

## Architecture

### Files added / modified

| Path | Status | Purpose |
|---|---|---|
| `mix.exs` | modify | Bump `oapi_generator` to `~> 0.4.0`. Bump version comes from semantic-release later. |
| `mix.lock` | regenerate | `mix deps.update --all` |
| `.mise.toml` | new | Pin Elixir 1.19.2 / OTP 28.1 (matches `.tool-versions`) |
| `.releaserc` | new | semantic-release config (mirrors pulsar, polarex paths) |
| `.github/dependabot.yml` | new | Daily `chore(deps)` PRs |
| `.github/workflows/ci.yml` | new | Format check + compile + test on push/PR |
| `.github/workflows/release.yml` | new | semantic-release on push to main |
| `.github/workflows/publish.yml` | new | On release created → `mix hex.publish --yes` |
| `.github/workflows/sync-spec.yml` | new | Weekly cron + manual dispatch → `mix sdk.build` → classify with oasdiff → PR |
| `lib/polarex/**` (generated) | regenerate | Result of running `mix sdk.build` with oapi_generator 0.4.0 |

### Component: `.releaserc`

Direct port of pulsar's `.releaserc` with polarex-specific replacements:

```json
{
  "plugins": [
    ["@semantic-release/commit-analyzer",  { "preset": "conventionalcommits" }],
    ["@semantic-release/release-notes-generator", { "preset": "conventionalcommits" }],
    "@semantic-release/changelog",
    ["@google/semantic-release-replace-plugin", {
      "replacements": [
        { "files": ["README.md"], "from": "{:polarex, \"~> .*\"}", "to": "{:polarex, \"~> ${nextRelease.version}\"}", "countMatches": true },
        { "files": ["mix.exs"],   "from": "version: \".*\"",       "to": "version: \"${nextRelease.version}\"",       "countMatches": true }
      ]
    }],
    ["@semantic-release/git", {
      "assets": ["mix.exs", "README.md", "CHANGELOG.md"],
      "message": "chore(release): v${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
    }],
    "@semantic-release/github"
  ]
}
```

**Key differences from pulsar:**
- **No** `{"type": "chore", "release": "patch"}` rule. We rely on the standard conventional-commits mapping: `feat` → minor, `fix` → patch, `chore` → no release. This gives the sync-spec workflow precise control over what triggers a bump.
- Replace patterns target polarex's `mix.exs` and `README.md` (line 18: `{:polarex, "~> 0.2.0"}`).

### Component: `.github/workflows/ci.yml`

Triggers on `push` to main and `pull_request`. Uses `jdx/mise-action@v2` per pulsar.

Steps:
1. Checkout
2. Install mise + cache
3. `mix deps.get`
4. `mix format --check-formatted`
5. `mix compile --warnings-as-errors`
6. `mix test`

No credo/dialyzer (polarex doesn't have them; codegen would fight them anyway).

### Component: `.github/workflows/release.yml`

Mirrors pulsar exactly:

```yaml
on:
  push:
    branches: [main]

permissions:
  contents: write
  issues: write
  pull-requests: write

jobs:
  release:
    if: "!contains(github.event.head_commit.message, '[skip release]')"
    steps:
      - uses: actions/checkout@v4
        with: { persist-credentials: false }
      - uses: cycjimmy/semantic-release-action@v4.1.1
        with:
          extra_plugins: |
            conventional-changelog-conventionalcommits@9.1.0
            @semantic-release/changelog@6.0.3
            @semantic-release/git@10.0.1
            @google/semantic-release-replace-plugin@1.2.7
        env:
          GITHUB_TOKEN: ${{ secrets.GH_PAT }}
```

### Component: `.github/workflows/publish.yml`

```yaml
on:
  release:
    types: [created]

jobs:
  publish:
    steps:
      - uses: actions/checkout@v4
      - uses: jdx/mise-action@v2
      - run: mix deps.get
      - run: mix hex.publish --yes
        env:
          HEX_API_KEY: ${{ secrets.HEX_API_KEY }}
```

(Inline `mix hex.publish --yes` instead of pulsar's `make publish` — polarex has no Makefile and we don't need one.)

### Component: `.github/workflows/sync-spec.yml` (new)

The interesting workflow. Triggered by:
- `schedule: cron: '0 6 * * 1'` (Mondays 06:00 UTC)
- `workflow_dispatch` (manual)

Steps:
1. Checkout (with `GH_PAT` so the resulting PR triggers CI on creation; default `GITHUB_TOKEN` does not).
2. Install mise.
3. `cp openapi.json /tmp/openapi.previous.json` — snapshot for diffing.
4. `mix deps.get && mix sdk.build` — pulls new spec + regenerates code.
5. **Detect change**: `git diff --quiet openapi.json` → if no change, exit cleanly (no PR).
6. **Classify with oasdiff** (`tufin/oasdiff` Docker image):
   ```sh
   oasdiff changelog /tmp/openapi.previous.json openapi.json --format=text > /tmp/changelog.txt
   oasdiff breaking /tmp/openapi.previous.json openapi.json --format=text > /tmp/breaking.txt
   ```
7. **Pick commit type** based on results:
   | oasdiff result | Commit subject | Body | Auto-merge? |
   |---|---|---|---|
   | `breaking` non-empty | `feat(spec)!: sync OpenAPI spec` | full changelog + `BREAKING CHANGE:` footer with breaking summary | **disabled** |
   | `changelog` has additions/changes (non-breaking) | `feat(spec): sync OpenAPI spec` | full changelog | enabled |
   | `changelog` only metadata/descriptions | `chore(spec): sync OpenAPI spec` | full changelog | enabled |
8. Create branch `chore/spec-sync-<run-id>`, commit changes, push, open PR via `gh pr create` (uses `GH_PAT`).
9. If non-breaking: `gh pr merge --auto --squash <PR>` to enable auto-merge.

The branch name uses `run-id` so a stuck PR doesn't block the next week's run.

**oasdiff classification details:**
- `oasdiff changelog` returns *all* changes with severity (`INFO`, `WARN`, `ERR`).
- We treat any `ERR` as breaking.
- We treat any `WARN`/`INFO` that includes endpoint or schema additions/changes as non-breaking-but-feature → `feat`.
- Pure `INFO` with only `description`/`summary`/`tags` changes → `chore`.

This logic lives in a small inline shell script in the workflow. If classification proves brittle in practice, we can extract it to a `scripts/classify-spec-diff.sh` helper later — but starting inline keeps things simple.

### Component: `.github/dependabot.yml`

```yaml
version: 2
updates:
  - package-ecosystem: mix
    directory: /
    schedule: { interval: daily }
    open-pull-requests-limit: 5
    commit-message: { prefix: "chore(deps)" }
```

Note: `chore(deps)` does **not** trigger a release on its own (we removed pulsar's `chore → patch` rule). Dependency updates that should ship to Hex must be merged together with a `fix:` or `feat:` commit, or you can manually retitle a single dep PR to `fix(deps): ...` to ship it. This is a deliberate trade-off — we don't want every transitive dep bump producing a Hex release.

If you want every dep update to ship: easy to add a `chore` rule later. Starting strict.

## Data flow

### Normal release flow

```
PR merged to main (e.g. "fix: handle nil response")
  → release.yml fires
  → semantic-release reads commits since last tag
  → bumps mix.exs version, updates README.md, generates CHANGELOG entry
  → commits "chore(release): vX.Y.Z [skip ci]" back to main
  → tags vX.Y.Z, creates GitHub Release
  → publish.yml fires on release: [created]
  → mix hex.publish --yes
```

### Weekly spec-sync flow (non-breaking)

```
Monday 06:00 UTC
  → sync-spec.yml fires
  → mix sdk.build (new openapi.json + regenerated lib/polarex/**)
  → oasdiff classifies: feat(spec)
  → opens PR "feat(spec): sync OpenAPI spec" with diff in body
  → CI runs (format/compile/test); when green, auto-merge squashes
  → release.yml fires (sees feat:)
  → minor bump → tagged → published to Hex
```

### Weekly spec-sync flow (breaking)

```
Same as above through PR creation, but:
  → oasdiff finds breaking changes → commit is "feat(spec)!: sync OpenAPI spec"
  → auto-merge NOT enabled
  → human reviews PR, decides whether to merge
  → on merge: feat! → major bump (e.g. 0.2.9 → 1.0.0)
```

### Bootstrap (first-time setup)

This is the one-time work to kick the pipeline into existence. Order matters.

**Required config migrations** (from `oapi_generator` 0.3.0 / 0.4.0 changelog):

- 0.3.0 made `field_casing` an `output` option (was top-level). polarex's `config/config.exs` currently has it at the top level — must move:
  ```elixir
  # before
  config :oapi_generator,
    default: [
      field_casing: :snake,
      output: [base_module: Polarex, ...]
    ]
  # after
  config :oapi_generator,
    default: [
      output: [
        field_casing: :snake,
        base_module: Polarex,
        ...
      ]
    ]
  ```
- 0.3.0 also changed operation module renaming to use `naming.rename` (same as schemas). polarex has no `naming.rename` config, so default behavior applies — but stale files may remain on disk after the rename. We delete `lib/polarex/operations/` and `lib/polarex/schemas/` before regen to avoid orphans (preserving `lib/polarex/support/` which is hand-written, and `lib/polarex.ex` / `lib/mix/`).
- 0.4.0 changed primitive-type representation: format-specified types (e.g. int32) are now `{type, format}` tuples. **This makes the regenerated code consumer-breaking** — `@spec` patterns change shape. The bootstrap regen commit takes a `feat!:` to honor this.

**Steps:**

1. **Discard the current dirty working tree** (181 modified files generated with old `oapi_generator 0.2.0` — they'll be overwritten by the new generator anyway, and starting from a clean baseline avoids merge confusion). Confirm with the user before this destructive op.
2. Bump `oapi_generator` in `mix.exs` from `~> 0.2.0` to `~> 0.4.0`. Run `mix deps.update oapi_generator` and `mix deps.update --all`.
3. Migrate `config/config.exs` per the bullet above (move `field_casing: :snake` into `output:`).
4. Delete generated dirs to avoid orphans from any rename changes:
   ```sh
   rm -rf lib/polarex/operations lib/polarex/schemas
   ```
5. Run `mix sdk.build` to regenerate `lib/polarex/**`. If the build fails, the error will name the broken config option — fix per `oapi_generator` docs and retry. (Most likely site of breakage: the `output:` block.)
6. Commit the regenerated tree as **one** commit:
   ```
   feat!: regenerate with oapi_generator 0.4.0

   BREAKING CHANGE: Primitive types with format specifiers are now
   represented as {type, format} tuples (e.g. {:integer, "int32"})
   instead of bare atoms. This affects @spec annotations and pattern
   matching in user code that destructures generated types.

   Operation modules may also have renamed paths per the new naming
   defaults. Bumps oapi_generator from 0.2.0 to 0.4.0.
   ```
7. Add the new files: `.mise.toml`, `.releaserc`, `.github/dependabot.yml`, the four workflow YAMLs. Commit: `ci: add semantic-release pipeline and weekly spec sync`.
8. **Seed the version tag** so semantic-release knows the baseline. Tag the *current* `9da14f2 Bump to 0.2.9` commit, **before** the regen commit from step 6 lands on the remote:
   ```sh
   git tag v0.2.9 9da14f2
   git push origin v0.2.9
   ```
9. Configure repository secrets (in GitHub UI):
   - `GH_PAT` — fine-grained PAT with `contents: write`, `pull-requests: write`, `issues: write` scopes on the polarex repo. Used by both `release.yml` (to commit version-bump back, and to make the GH Release event fire `publish.yml`) and `sync-spec.yml` (to open PRs that trigger CI).
   - `HEX_API_KEY` — from `mix hex.user key generate`.
10. **Set up branch protection on `main`** in the GitHub UI: require `ci` to pass before merge. This is required for `gh pr merge --auto` to actually wait for CI rather than merging immediately.
11. Push the bootstrap commits to main. Watch:
    - `release.yml` runs → sees `feat!:` since `v0.2.9` → bumps to **`1.0.0`**, tags, creates GH release.
    - `publish.yml` runs → publishes `1.0.0` to Hex.

## Risks & open questions

- **0.2 → 0.4 generator config migration.** Pre-known: `field_casing` moves into `output:` (per 0.3.0 changelog). Step 3 of bootstrap handles it. If the new generator surfaces *additional* config drift not listed in the changelog, fix ad hoc when `mix sdk.build` errors.
- **0.4.0 primitive-type tuples are consumer-breaking.** Anyone pattern-matching on `:integer` (etc.) in their code will break when they get `{:integer, "int32"}`. The bootstrap commit's `BREAKING CHANGE:` footer surfaces this in the 1.0.0 release notes; we cannot mitigate it further without a 0.4 → 0.2 type adapter (out of scope, defeats the upgrade).
- **First spec diff vs. the openapi.json currently in the repo** may show a large changelog if Polar has shipped substantial API changes since the last 0.2.9 sync. The bootstrap commit will already include the latest spec, so the **first weekly cron run** will diff against that fresh baseline — no surprise on the first cron.
- **oasdiff misclassifying a change.** If `oasdiff` mislabels something as non-breaking when it actually breaks generated-code consumers (e.g. an enum value rename), auto-merge will ship it as `feat:`. Mitigation: the PR body shows the full changelog so a reviewer *could* catch it pre-merge — but with auto-merge enabled, that window is brief. Acceptable: if it slips, ship a `fix:` patch and (if needed) yank the bad release on Hex within the 1-hour window.
- **Auto-merge requires branch protection + GH_PAT** to be wired correctly. If `GITHUB_TOKEN` is used to open the PR, CI won't run on PR creation and auto-merge will hang.
- **`chore(deps)` not triggering a release** by design — accept that `mix.lock` updates require a piggyback `fix:` or manual title edit to ship.

## What this design intentionally does NOT do

- No release branches (`next`, `beta`).
- No prerelease tags (`-alpha.1`).
- No version-bump commit on a `chore(deps)` merge.
- No automated `mix.lock` rebase on the spec-sync PR (dependabot handles deps separately).

# Semantic-Release Pipeline + Weekly Spec Sync — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace polarex's manual `Bump to X.Y.Z` + `mix hex.publish` workflow with an automated conventional-commits semantic-release pipeline, and add a weekly cron that pulls Polar's OpenAPI spec and opens an auto-merging PR with a SemVer-honest commit type (classified by `oasdiff`). Bootstrap the upgrade by bumping `oapi_generator` from 0.2.0 → 0.4.0.

**Architecture:** Mirror the `pulsar-elixir` pipeline (`.releaserc` + cycjimmy/semantic-release-action + a separate `publish.yml` listening on `release: [created]`). Add a polarex-specific `sync-spec.yml` that runs `mix sdk.build`, classifies the openapi diff with `tufin/oasdiff`, and opens a PR with the commit subject keyed off the classification (`chore` / `feat` / `feat!`). All workflows use mise via `jdx/mise-action@v2`.

**Tech Stack:** GitHub Actions, mise, semantic-release (Node), `cycjimmy/semantic-release-action@v4.1.1`, `tufin/oasdiff` Docker image, Elixir 1.19.2 / OTP 28.1, Hex.

**Spec:** `docs/superpowers/specs/2026-05-07-semantic-release-and-spec-sync-design.md`

---

## File Structure

| Path | Status | Responsibility |
|---|---|---|
| `mix.exs` | modify | bump `oapi_generator` to `~> 0.4.0` |
| `mix.lock` | regenerate | `mix deps.update --all` outputs |
| `config/config.exs` | modify | move `field_casing: :snake` into `output:` block (0.3.0 breaking change) |
| `lib/polarex/operations/**` | regenerate | output of `mix sdk.build` with new generator |
| `lib/polarex/schemas/**` | regenerate | output of `mix sdk.build` with new generator |
| `.mise.toml` | new | pin Elixir/Erlang versions (replicates `.tool-versions` in mise format) |
| `.releaserc` | new | semantic-release plugin chain (commit-analyzer, release-notes, changelog, replace, git, github) |
| `.github/dependabot.yml` | new | daily mix dep PRs prefixed `chore(deps)` |
| `.github/workflows/ci.yml` | new | format check + compile (warnings-as-errors) + test on push/PR |
| `.github/workflows/release.yml` | new | run semantic-release on push to main |
| `.github/workflows/publish.yml` | new | on `release: [created]`, publish to Hex |
| `.github/workflows/sync-spec.yml` | new | weekly cron + manual dispatch: `mix sdk.build`, classify diff with oasdiff, open PR |

---

## Conventions used by every task

- Conventional commit prefixes: `feat:` (minor), `feat!:` (major + `BREAKING CHANGE:` body), `fix:` (patch), `chore:` (no release), `ci:` (no release).
- Each task ends with a commit on a working branch named `bootstrap/semantic-release` (the user will fast-forward to `main` once everything is verified). Tasks 8 and 11 are exceptions — task 8's `feat!:` regen commit is the one that earns the 1.0.0 bump on first release run; task 11's `git tag` happens on the previous-state commit `9da14f2` and is pushed to origin.
- After every commit, run `git status` and confirm the working tree is clean before moving on.

---

## Task 1: Snapshot the dirty working tree, then reset

**Files:**
- Discard: every modified/untracked file currently shown in `git status`.

**Why this task exists:** the working tree currently contains 181 files regenerated with the **old** `oapi_generator 0.2.0`. Those files will be overwritten when we regenerate with 0.4.0 in Task 8 anyway; starting from a clean baseline avoids merge confusion and makes the `feat!:` regen commit a clean diff against `9da14f2`.

- [ ] **Step 1: Stash the dirty tree as a safety net before discarding**

The user will be told to delete the stash later if the bootstrap succeeds, but we keep it for now in case anything goes sideways.

```bash
cd /Users/giuseppedepalma/Developer/toaba/polarex
git stash push -u -m "pre-bootstrap snapshot of 0.2.0 regen output"
```

Expected output: `Saved working directory and index state On <branch>: pre-bootstrap snapshot of 0.2.0 regen output`

- [ ] **Step 2: Verify the working tree is clean**

```bash
git status
```

Expected output: `nothing to commit, working tree clean`. If it isn't (e.g. erl_crash.dump still listed), `git clean -fd` to remove untracked files (the existing `.gitignore` should already cover them — confirm before running).

- [ ] **Step 3: Create the working branch**

```bash
git checkout -b bootstrap/semantic-release
```

Expected output: `Switched to a new branch 'bootstrap/semantic-release'`

(No commit at end of this task — nothing to commit. The branch creation is the deliverable.)

---

## Task 2: Bump `oapi_generator` to 0.4.0 in mix.exs

**Files:**
- Modify: `mix.exs:56`

- [ ] **Step 1: Edit mix.exs**

Replace the dep tuple in `defp deps`:

```elixir
# before (line 56)
{:oapi_generator, "~> 0.2.0", only: :dev, runtime: false},
# after
{:oapi_generator, "~> 0.4.0", only: :dev, runtime: false},
```

- [ ] **Step 2: Update the lock file**

```bash
mix deps.update oapi_generator
```

Expected: `oapi_generator` line in `mix.lock` updated to a `0.4.x` version. Other deps untouched.

- [ ] **Step 3: Sanity-check that `mix.exs` still parses**

```bash
mix deps
```

Expected: prints the dep tree without errors. `oapi_generator` shows version 0.4.x.

- [ ] **Step 4: Commit**

```bash
git add mix.exs mix.lock
git commit -m "chore(deps): bump oapi_generator to ~> 0.4.0"
```

(Commit type `chore` deliberately — by itself this commit changes only dev tooling, no shippable change. The shippable break comes from the regen in Task 8.)

---

## Task 3: Migrate `config/config.exs` for oapi_generator 0.3.0 breaking change

**Files:**
- Modify: `config/config.exs:3-15`

**Why:** 0.3.0 changelog: "Configuration option `field_casing` is now `output.field_casing`." Without this, `mix sdk.build` will likely fail.

- [ ] **Step 1: Edit config/config.exs**

Replace the `:oapi_generator` block:

```elixir
# before
if Mix.env() == :dev do
  config :oapi_generator,
    default: [
      field_casing: :snake,
      output: [
        base_module: Polarex,
        default_client: Polarex.Support.Client,
        location: "lib/polarex",
        operation_subdirectory: "/operations/",
        schema_subdirectory: "/schemas/"
      ]
    ]
end

# after
if Mix.env() == :dev do
  config :oapi_generator,
    default: [
      output: [
        field_casing: :snake,
        base_module: Polarex,
        default_client: Polarex.Support.Client,
        location: "lib/polarex",
        operation_subdirectory: "/operations/",
        schema_subdirectory: "/schemas/"
      ]
    ]
end
```

- [ ] **Step 2: Sanity-compile**

```bash
mix compile
```

Expected: clean compile of polarex itself (the existing generated code is still on disk from Task 1 reset — should compile against the dep changes only).

- [ ] **Step 3: Commit**

```bash
git add config/config.exs
git commit -m "chore: migrate oapi_generator config for 0.3.0 (field_casing -> output.field_casing)"
```

---

## Task 4: Add `.mise.toml` to pin toolchain

**Files:**
- Create: `.mise.toml`

**Why:** every workflow uses `jdx/mise-action@v2`, which reads `.mise.toml`. Mirrors `.tool-versions` (Elixir 1.19.2, Erlang 28.1).

- [ ] **Step 1: Create the file**

```toml
[tools]
elixir = "1.19.2"
erlang = "28.1"
```

- [ ] **Step 2: Verify mise picks it up locally** (optional — only if `mise` is installed)

```bash
mise current
```

Expected: shows elixir 1.19.2 and erlang 28.1. If `mise` isn't installed locally, skip — CI is the real test.

- [ ] **Step 3: Commit**

```bash
git add .mise.toml
git commit -m "ci: add .mise.toml pinning Elixir 1.19.2 / Erlang 28.1"
```

---

## Task 5: Add `.releaserc` (semantic-release plugin chain)

**Files:**
- Create: `.releaserc`

- [ ] **Step 1: Create the file** (JSON, not strict JSON — semantic-release accepts either; we use the same pattern as pulsar's)

```json
{
  "plugins": [
    [
      "@semantic-release/commit-analyzer",
      {
        "preset": "conventionalcommits"
      }
    ],
    [
      "@semantic-release/release-notes-generator",
      {
        "preset": "conventionalcommits"
      }
    ],
    "@semantic-release/changelog",
    [
      "@google/semantic-release-replace-plugin",
      {
        "replacements": [
          {
            "files": ["README.md"],
            "from": "{:polarex, \"~> .*\"}",
            "to": "{:polarex, \"~> ${nextRelease.version}\"}",
            "results": [
              {
                "file": "README.md",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          },
          {
            "files": ["mix.exs"],
            "from": "version: \".*\"",
            "to": "version: \"${nextRelease.version}\"",
            "results": [
              {
                "file": "mix.exs",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          }
        ]
      }
    ],
    [
      "@semantic-release/git",
      {
        "assets": ["mix.exs", "README.md", "CHANGELOG.md"],
        "message": "chore(release): v${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
      }
    ],
    "@semantic-release/github"
  ]
}
```

**Note vs pulsar:** we deliberately omit `releaseRules` so the standard conventional-commits mapping applies (`chore` does NOT bump version). This means `chore(deps)` PRs don't ship to Hex; only `fix:` and `feat:` do.

- [ ] **Step 2: Commit**

```bash
git add .releaserc
git commit -m "ci: add semantic-release configuration"
```

---

## Task 6: Add CI workflow

**Files:**
- Create: `.github/workflows/ci.yml`

- [ ] **Step 1: Ensure `.github/workflows/` exists**

```bash
mkdir -p .github/workflows
```

- [ ] **Step 2: Create `ci.yml`**

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

env:
  MIX_ENV: test

jobs:
  build:
    name: Build & Test
    runs-on: ubuntu-latest
    if: "!contains(github.event.head_commit.message, '[skip tests]')"

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Install mise
        uses: jdx/mise-action@v2
        with:
          experimental: true

      - name: Cache mise tools
        uses: actions/cache@v4
        with:
          path: |
            ~/.local/share/mise
            ~/.cache/mise
          key: ${{ runner.os }}-mise-${{ hashFiles('.mise.toml') }}
          restore-keys: ${{ runner.os }}-mise-

      - name: Cache mix deps
        uses: actions/cache@v4
        with:
          path: |
            deps
            _build
          key: ${{ runner.os }}-mix-${{ hashFiles('**/mix.lock') }}
          restore-keys: ${{ runner.os }}-mix-

      - name: Get deps
        run: mix deps.get

      - name: Format check
        run: mix format --check-formatted

      - name: Compile (warnings as errors)
        run: mix compile --warnings-as-errors

      - name: Test
        run: mix test
```

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add CI workflow (format, compile, test)"
```

---

## Task 7: Add release + publish workflows

**Files:**
- Create: `.github/workflows/release.yml`
- Create: `.github/workflows/publish.yml`

- [ ] **Step 1: Create `release.yml`**

```yaml
name: Release

on:
  push:
    branches: [main]

permissions:
  contents: write
  issues: write
  pull-requests: write

jobs:
  release:
    runs-on: ubuntu-latest
    if: "!contains(github.event.head_commit.message, '[skip release]')"
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          persist-credentials: false
          fetch-depth: 0

      - name: Run semantic-release
        uses: cycjimmy/semantic-release-action@v4.1.1
        with:
          extra_plugins: |
            conventional-changelog-conventionalcommits@9.1.0
            @semantic-release/changelog@6.0.3
            @semantic-release/git@10.0.1
            @google/semantic-release-replace-plugin@1.2.7
          branches: |
            ['main']
        env:
          GITHUB_TOKEN: ${{ secrets.GH_PAT }}
```

**Why `secrets.GH_PAT` instead of `GITHUB_TOKEN`:** the GitHub Release created with the default `GITHUB_TOKEN` does *not* trigger the `release: [created]` event in `publish.yml`. A user PAT does. (Same reason pulsar uses `GH_PAT_HEX`.)

**Why `fetch-depth: 0`:** semantic-release walks tag history to determine the next version; shallow clones break this.

- [ ] **Step 2: Create `publish.yml`**

```yaml
name: Publish

on:
  release:
    types: [created]

jobs:
  publish:
    name: Publish to Hex
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Install mise
        uses: jdx/mise-action@v2
        with:
          experimental: true

      - name: Cache mix deps
        uses: actions/cache@v4
        with:
          path: |
            deps
            _build
          key: ${{ runner.os }}-mix-${{ hashFiles('**/mix.lock') }}
          restore-keys: ${{ runner.os }}-mix-

      - name: Get deps
        run: mix deps.get

      - name: Publish to Hex
        run: mix hex.publish --yes
        env:
          HEX_API_KEY: ${{ secrets.HEX_API_KEY }}
```

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/release.yml .github/workflows/publish.yml
git commit -m "ci: add semantic-release + Hex publish workflows"
```

---

## Task 8: Add weekly spec-sync workflow

**Files:**
- Create: `.github/workflows/sync-spec.yml`

This is the polarex-specific workflow. Logic: download new spec → regen → if no diff, exit; if diff, classify with `oasdiff`, set the commit subject + auto-merge flag accordingly.

- [ ] **Step 1: Create `sync-spec.yml`**

```yaml
name: Sync OpenAPI Spec

on:
  schedule:
    - cron: '0 6 * * 1'  # Mondays 06:00 UTC
  workflow_dispatch: {}

permissions:
  contents: write
  pull-requests: write

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          token: ${{ secrets.GH_PAT }}
          fetch-depth: 0

      - name: Configure git author
        run: |
          git config user.name "polarex-bot"
          git config user.email "polarex-bot@users.noreply.github.com"

      - name: Snapshot previous spec
        run: cp openapi.json /tmp/openapi.previous.json

      - name: Install mise
        uses: jdx/mise-action@v2
        with:
          experimental: true

      - name: Cache mix deps
        uses: actions/cache@v4
        with:
          path: |
            deps
            _build
          key: ${{ runner.os }}-mix-${{ hashFiles('**/mix.lock') }}
          restore-keys: ${{ runner.os }}-mix-

      - name: Get deps
        run: mix deps.get

      - name: Regenerate SDK
        run: mix sdk.build

      - name: Detect change
        id: diff
        run: |
          if git diff --quiet openapi.json; then
            echo "changed=false" >> "$GITHUB_OUTPUT"
            echo "No spec change."
          else
            echo "changed=true" >> "$GITHUB_OUTPUT"
          fi

      - name: Classify with oasdiff
        if: steps.diff.outputs.changed == 'true'
        id: classify
        run: |
          set -euo pipefail
          docker run --rm \
            -v /tmp/openapi.previous.json:/specs/previous.json:ro \
            -v "${{ github.workspace }}/openapi.json:/specs/current.json:ro" \
            tufin/oasdiff:latest \
            changelog /specs/previous.json /specs/current.json --format text > /tmp/changelog.txt || true

          docker run --rm \
            -v /tmp/openapi.previous.json:/specs/previous.json:ro \
            -v "${{ github.workspace }}/openapi.json:/specs/current.json:ro" \
            tufin/oasdiff:latest \
            breaking /specs/previous.json /specs/current.json --format text > /tmp/breaking.txt || true

          if [ -s /tmp/breaking.txt ]; then
            echo "kind=breaking" >> "$GITHUB_OUTPUT"
            echo "subject=feat(spec)!: sync OpenAPI spec" >> "$GITHUB_OUTPUT"
            echo "automerge=false" >> "$GITHUB_OUTPUT"
          elif [ -s /tmp/changelog.txt ]; then
            # any non-breaking change (additions, modifications). Treat as feat
            # unless the changelog is *only* description-level.
            if grep -Eqv '^\s*(description|summary|tags)' /tmp/changelog.txt; then
              echo "kind=feat" >> "$GITHUB_OUTPUT"
              echo "subject=feat(spec): sync OpenAPI spec" >> "$GITHUB_OUTPUT"
            else
              echo "kind=chore" >> "$GITHUB_OUTPUT"
              echo "subject=chore(spec): sync OpenAPI spec" >> "$GITHUB_OUTPUT"
            fi
            echo "automerge=true" >> "$GITHUB_OUTPUT"
          else
            # Spec bytes changed but oasdiff found nothing semantic — chore.
            echo "kind=chore" >> "$GITHUB_OUTPUT"
            echo "subject=chore(spec): sync OpenAPI spec" >> "$GITHUB_OUTPUT"
            echo "automerge=true" >> "$GITHUB_OUTPUT"
          fi

      - name: Build PR body
        if: steps.diff.outputs.changed == 'true'
        id: body
        run: |
          {
            echo "Automated weekly OpenAPI spec sync."
            echo
            echo "## Classification"
            echo
            echo "- Kind: \`${{ steps.classify.outputs.kind }}\`"
            echo "- Auto-merge: ${{ steps.classify.outputs.automerge }}"
            echo
            echo "## oasdiff changelog"
            echo
            echo '```'
            cat /tmp/changelog.txt 2>/dev/null || echo "(no semantic changes detected)"
            echo '```'
            if [ -s /tmp/breaking.txt ]; then
              echo
              echo "## Breaking changes"
              echo
              echo '```'
              cat /tmp/breaking.txt
              echo '```'
            fi
          } > /tmp/pr-body.md
          echo "path=/tmp/pr-body.md" >> "$GITHUB_OUTPUT"

      - name: Build commit message
        if: steps.diff.outputs.changed == 'true'
        id: commit
        run: |
          {
            echo "${{ steps.classify.outputs.subject }}"
            echo
            echo "Automated spec sync — see PR description for oasdiff output."
            if [ "${{ steps.classify.outputs.kind }}" = "breaking" ]; then
              echo
              echo "BREAKING CHANGE: see oasdiff breaking output in the PR."
            fi
          } > /tmp/commit-msg.txt
          echo "path=/tmp/commit-msg.txt" >> "$GITHUB_OUTPUT"

      - name: Create branch and commit
        if: steps.diff.outputs.changed == 'true'
        id: branch
        run: |
          BRANCH="chore/spec-sync-${{ github.run_id }}"
          git checkout -b "$BRANCH"
          git add openapi.json lib/polarex
          git commit -F /tmp/commit-msg.txt
          git push -u origin "$BRANCH"
          echo "name=$BRANCH" >> "$GITHUB_OUTPUT"

      - name: Open PR
        if: steps.diff.outputs.changed == 'true'
        id: pr
        env:
          GH_TOKEN: ${{ secrets.GH_PAT }}
        run: |
          PR_URL=$(gh pr create \
            --title "${{ steps.classify.outputs.subject }}" \
            --body-file /tmp/pr-body.md \
            --base main \
            --head "${{ steps.branch.outputs.name }}")
          echo "url=$PR_URL" >> "$GITHUB_OUTPUT"

      - name: Enable auto-merge (non-breaking only)
        if: steps.diff.outputs.changed == 'true' && steps.classify.outputs.automerge == 'true'
        env:
          GH_TOKEN: ${{ secrets.GH_PAT }}
        run: gh pr merge --auto --squash "${{ steps.pr.outputs.url }}"
```

**Notes on the classification heuristic:**
- We treat `oasdiff breaking` (non-empty stdout) as the source of truth for breaking — that's the safest signal.
- For non-breaking, the `grep -Eqv '^\s*(description|summary|tags)'` line says "if the changelog has *any* line that isn't purely a description/summary/tag tweak, treat it as `feat`". This errs on the side of `feat` when ambiguous, which is what we want for a codegen library.
- The Docker calls use `:latest` for simplicity. If reproducibility becomes a concern, pin to a release tag like `tufin/oasdiff:v1.10.x` later.

- [ ] **Step 2: Commit**

```bash
git add .github/workflows/sync-spec.yml
git commit -m "ci: add weekly OpenAPI spec sync workflow with oasdiff classification"
```

---

## Task 9: Add Dependabot config

**Files:**
- Create: `.github/dependabot.yml`

- [ ] **Step 1: Create the file**

```yaml
version: 2
updates:
  - package-ecosystem: "mix"
    directory: "/"
    schedule:
      interval: "daily"
    open-pull-requests-limit: 5
    rebase-strategy: "auto"
    commit-message:
      prefix: "chore(deps)"
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 5
    commit-message:
      prefix: "chore(actions)"
```

(Adds GitHub Actions dep updates too, since we just added a bunch.)

- [ ] **Step 2: Commit**

```bash
git add .github/dependabot.yml
git commit -m "ci: add Dependabot for mix and GitHub Actions updates"
```

---

## Task 10: Regenerate the SDK with oapi_generator 0.4.0

**Files:**
- Delete: `lib/polarex/operations/` (entire directory)
- Delete: `lib/polarex/schemas/` (entire directory)
- Regenerate: `lib/polarex/operations/**`, `lib/polarex/schemas/**`, `openapi.json` (refreshed)
- Preserve: `lib/polarex/support/`, `lib/polarex.ex`, `lib/mix/`

This is the breaking-change commit — it's what earns the 1.0.0 bump on first release.

- [ ] **Step 1: Confirm working tree is clean before regen**

```bash
git status
```

Expected: `nothing to commit, working tree clean` on `bootstrap/semantic-release`. If not, stop and resolve.

- [ ] **Step 2: Delete the old generated dirs**

```bash
rm -rf lib/polarex/operations lib/polarex/schemas
```

- [ ] **Step 3: Run the SDK build**

```bash
mix sdk.build
```

Expected: downloads fresh `openapi.json`, then runs `mix api.gen default openapi.json`. Output: `lib/polarex/operations/*.ex` and `lib/polarex/schemas/*.ex` regenerated. If this errors with a config message, fix `config/config.exs` per the error and amend Task 3's commit before continuing — see oapi_generator 0.3.0 / 0.4.0 changelogs for option renames.

- [ ] **Step 4: Compile and ensure warnings-as-errors passes**

```bash
mix compile --warnings-as-errors
```

Expected: clean compile. Most likely failure is generated code referencing types in a shape the support module doesn't expect — if so, `lib/polarex/support/translator.ex` may need a small adjustment for the new `{type, format}` tuple representation. Investigate and fix.

- [ ] **Step 5: Run tests**

```bash
mix test
```

Expected: `ExUnit.start()` runs an empty suite (the only test file is `test_helper.exs` with no actual tests). Passes trivially.

- [ ] **Step 6: Commit with `feat!:` and BREAKING CHANGE footer**

```bash
git add openapi.json lib/polarex/operations lib/polarex/schemas

# If support/translator.ex needed adjusting in step 4, also:
# git add lib/polarex/support/translator.ex

git commit -F- <<'EOF'
feat!: regenerate SDK with oapi_generator 0.4.0

Bumps the OpenAPI code generator from 0.2.0 to 0.4.0, regenerating all
operation and schema modules. This refresh also pulls the latest Polar
OpenAPI spec.

BREAKING CHANGE: Primitive types with format specifiers are now
represented as {type, format} tuples (e.g. {:integer, "int32"}) instead
of bare atoms. This changes @spec annotations and the shape of any
consumer code that pattern-matches on generated types.

Operation and schema module names may have shifted per oapi_generator
0.3.0's renaming defaults. Consult the regenerated lib/polarex/ tree
when upgrading.
EOF
```

(`feat!:` + `BREAKING CHANGE:` body causes semantic-release to bump major. From `v0.2.9` baseline → `1.0.0`.)

---

## Task 11: Push branch and seed v0.2.9 baseline tag

**Files:** none modified — pure git plumbing.

This is the gate before merging to main. The `v0.2.9` tag MUST exist on origin **before** the bootstrap commits land on main, otherwise semantic-release will treat the entire commit history as one release and bump to a wrong version.

- [ ] **Step 1: Tag the pre-bootstrap commit as v0.2.9**

The current `main` ends at `9da14f2 Bump to 0.2.9`. Tag that commit:

```bash
git tag v0.2.9 9da14f2
```

Expected: no output (success).

- [ ] **Step 2: Push the tag**

```bash
git push origin v0.2.9
```

Expected: `* [new tag] v0.2.9 -> v0.2.9`.

- [ ] **Step 3: Push the bootstrap branch (do NOT merge to main yet)**

```bash
git push -u origin bootstrap/semantic-release
```

Expected: branch pushed, GitHub URL printed. **Stop here.** The next steps are manual configuration in the GitHub UI — see Task 12.

---

## Task 12: Configure GitHub repository (manual UI steps)

**Files:** none — these are operations on `github.com/giusdp/polarex`.

This task is performed by the human user, not an agent. An agent should pause here and surface the checklist below to the user.

- [ ] **Step 1: Add `GH_PAT` secret**

In GitHub: *Settings → Secrets and variables → Actions → New repository secret*.

- Name: `GH_PAT`
- Value: a fine-grained Personal Access Token scoped to the `polarex` repo with these permissions:
  - **Contents:** Read and write (push commits, create branches/tags)
  - **Pull requests:** Read and write (open PRs, enable auto-merge)
  - **Issues:** Read and write (semantic-release sometimes posts issue comments)

To create the PAT: GitHub user settings → *Developer settings → Personal access tokens → Fine-grained tokens → Generate new token*. Set repo access to "Only select repositories" → polarex.

- [ ] **Step 2: Add `HEX_API_KEY` secret**

Locally, generate a Hex publishing key:

```bash
mix hex.user key generate --name polarex-ci --permission api:write
```

Expected: prints a key like `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`.

In GitHub *Settings → Secrets and variables → Actions → New repository secret*:
- Name: `HEX_API_KEY`
- Value: the key from above.

- [ ] **Step 3: Set up branch protection on `main`**

GitHub *Settings → Branches → Branch protection rules → Add rule*:

- Branch name pattern: `main`
- Require a pull request before merging: **on**
- Require status checks to pass before merging: **on**
  - Required check: `Build & Test` (the job name from `ci.yml`)
- Require branches to be up to date before merging: **on**
- Allow force pushes: **off**
- Allow deletions: **off**

This is required for `gh pr merge --auto` to actually wait for CI. Without it, auto-merge will merge immediately on PR creation, defeating the safety gate.

- [ ] **Step 4: Verify everything is in place**

- `gh secret list` (locally) shows `GH_PAT` and `HEX_API_KEY`.
- `gh api repos/giusdp/polarex/branches/main/protection` returns a non-error (means protection is configured).

---

## Task 13: Open PR for the bootstrap branch and watch it through

**Files:** none — observation only.

- [ ] **Step 1: Open the bootstrap PR**

```bash
gh pr create \
  --base main \
  --head bootstrap/semantic-release \
  --title "feat!: bootstrap semantic-release pipeline + bump oapi_generator to 0.4.0" \
  --body "Bootstrap the automated release pipeline. See docs/superpowers/specs/2026-05-07-semantic-release-and-spec-sync-design.md for design context.

Once merged, the next push to main will trigger semantic-release. Because Task 10's commit is feat! with a BREAKING CHANGE footer, the release will bump to v1.0.0 and publish to Hex automatically."
```

- [ ] **Step 2: Watch CI on the PR**

```bash
gh pr checks --watch
```

Expected: `Build & Test / build` passes. If anything fails (likely candidates: format issues from regenerated code, compile warnings under 0.4.0), iterate — push fixes to the branch, watch again.

- [ ] **Step 3: Merge the PR**

Squash-merge via GitHub UI, or:

```bash
gh pr merge --squash --auto
```

The squashed commit message must preserve the `feat!:` prefix and `BREAKING CHANGE:` footer (semantic-release reads the merge commit on `main`). Use the GitHub UI's "Edit commit message" if needed:

```
feat!: bootstrap semantic-release pipeline + bump oapi_generator to 0.4.0

[body of all the commits — most importantly the BREAKING CHANGE footer
from Task 10's commit must be preserved]

BREAKING CHANGE: Primitive types with format specifiers are now
represented as {type, format} tuples (e.g. {:integer, "int32"}) instead
of bare atoms. This changes @spec annotations and the shape of any
consumer code that pattern-matches on generated types.
```

- [ ] **Step 4: Watch the release pipeline run**

After merge to main:

```bash
gh run watch
```

Expected sequence:
1. `Release` workflow runs → semantic-release determines `1.0.0` from the BREAKING CHANGE → tags `v1.0.0`, creates GitHub release, commits `chore(release): v1.0.0 [skip ci]` with updated `mix.exs`/`README.md`/`CHANGELOG.md`.
2. `Publish` workflow fires on the new release → runs `mix hex.publish --yes` → polarex 1.0.0 lives on Hex.

- [ ] **Step 5: Verify on Hex**

```bash
curl -s https://hex.pm/api/packages/polarex | jq '.releases[0].version'
```

Expected: `"1.0.0"`.

- [ ] **Step 6: Drop the safety stash from Task 1**

If everything looks good:

```bash
git stash drop stash@{0}
```

(This is optional; nothing breaks if you keep it.)

---

## Task 14: Smoke-test the spec-sync workflow

**Files:** none — manual run.

- [ ] **Step 1: Trigger sync-spec.yml manually**

```bash
gh workflow run sync-spec.yml
```

- [ ] **Step 2: Watch it run**

```bash
gh run watch
```

Expected behaviors:
- If the spec hasn't changed since the bootstrap (likely, since you just regenerated): job exits cleanly without opening a PR. Logs show "No spec change."
- If it has changed: a PR appears with the right `feat(spec)` / `chore(spec)` / `feat(spec)!` subject, the oasdiff changelog in the body, and (for non-breaking) auto-merge enabled.

- [ ] **Step 3: Optional — force a test run**

To prove the auto-merge path end to end *before* it really matters, you can:

1. On a throwaway branch, `touch openapi.json && git commit --allow-empty -m "test"` then `git push`.
2. Re-trigger sync-spec.yml — but easier: just wait for next Monday's cron, or revisit when Polar publishes a real spec change.

Skip this step if you're confident from reading the workflow.

---

## Self-review (already performed inline)

- ✅ **Spec coverage**: every section of the design doc maps to a task — `.releaserc` (T5), CI (T6), release+publish (T7), sync-spec (T8), dependabot (T9), oapi_generator bump (T2), config migration (T3), regen (T10), tag seed (T11), secrets/branch protection (T12), end-to-end verification (T13–14).
- ✅ **No placeholders**: every code/YAML block is concrete; every command has expected output; commit messages spelled out.
- ✅ **Type/name consistency**: secret names (`GH_PAT`, `HEX_API_KEY`), workflow names (`Build & Test` referenced in T12 step 3 matches the `name:` in T6's `ci.yml`), branch name (`bootstrap/semantic-release`) consistent across T1, T11, T13.
- ✅ **One known soft spot**: T10 step 4 says "may need a small adjustment for the new `{type, format}` tuple representation" — this is the one place we can't predict exactly because we haven't run the regen yet. The plan acknowledges this as a possible inline fix and instructs to re-stage and amend Task 3's commit if config-level breakage surfaces. That's the right level of detail given we genuinely don't know what 0.4.0 will produce until we run it.

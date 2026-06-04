# Polarex: Polar.sh Elixir Client — Nightly Track

> This is the **nightly** track of Polarex.
> The SDK is regenerated daily from the latest Polar.sh OpenAPI spec.
> For the stable (Hex) release, see the [`main`](https://github.com/spapiernik/polarex/tree/main) branch.

---

This library uses the Elixir [OpenAPI Code Generator](https://github.com/aj-foster/open-api-generator) to turn the Polar.sh OpenAPI spec into an ergonomic client.

## Installation

### Nightly (GitHub)

To track the latest daily build:

```elixir
def deps do
  [
    {:polarex, github: "spapiernik/polarex", branch: "nightly"}
  ]
end
```

To pin to a specific nightly release:

```elixir
def deps do
  [
    {:polarex, github: "spapiernik/polarex", tag: "v2026.06.01"}
  ]
end
```

### Stable (Hex)

For the stable release aligned with the upstream Polarex:

```elixir
def deps do
  [
    {:polarex, "~> 0.4.0"}
  ]
end
```

Then install the dependency using `mix deps.get`.

## Configuration

This library will need the Polar.sh API base URL and your access token to work.

```elixir
config :polarex,
  server: "https://sandbox-api.polar.sh", # or "https://api.polar.sh" for production
  access_token: "your_access_token"
```

## Usage

All of the client operations are generated based on the OpenAPI description provided by Polar.sh.
In general, you can expect to find:

```elixir
Polarex.Resource.operation(...)
```

Where:

* `Resource` is the name of the resource such as `Checkouts`.
* `operation` is the name of the route, such as `checkouts_list`.
* Besides their specific arguments, all operations accept a keyword list of options.

So to list all checkouts, you would use:

```elixir
Polarex.Checkouts.checkouts_list([])
```

## Contributing

Because this library uses a code generator for the majority of its mass, there are two modes of contribution.
Please consider these when creating issues or opening pull requests:

* If the generated code is out of date, there is a mix task `mix sdk.build` that will pull the latest spec and generate the code.
* In the the support folder there is a [req](https://github.com/wojtekmach/req) client that does the actual HTTP requests. If you find a bug or want to improve it (e.g. adding telemetry), you can add to `Polarex.Support.Client` and open a pull request.



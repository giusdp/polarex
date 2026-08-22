# Polarex: Polar.sh Elixir Client

[![Hex.pm](https://img.shields.io/hexpm/v/polarex)](https://hex.pm/packages/polarex)
[![Documentation](https://img.shields.io/badge/hex-docs-blue)](https://hexdocs.pm/polarex)

---

This library uses the Elixir [OpenAPI Code Generator](https://github.com/aj-foster/open-api-generator) to turn the Polar.sh OpenAPI spec into an ergonomic client.

## Installation

This library is available on Hex.pm.
Add the dependency in `mix.exs`:

```elixir
def deps do
  [
    {:polarex, "~> 0.7.0"}
  ]
end
```

Then install the dependency using `mix deps.get`.

## Configuration

This library will need the Polar.sh API base URL and your access token to work.

```elixir
config :polarex,
  server: "https://sandbox-api.polar.sh", # or "https://api.polar.sh" for production
  access_token: "your_access_token",
  req_options: [] # optional, merged into every underlying Req request
```

Every operation also accepts a `req_options:` option that wins over the
global one for that call.

### Testing

`req_options` is the hook for stubbing HTTP in your tests with
[`Req.Test`](https://hexdocs.pm/req/Req.Test.html):

```elixir
# config/test.exs
config :polarex, req_options: [plug: {Req.Test, Polarex}]

# in a test
Req.Test.expect(Polarex, fn conn ->
  Req.Test.json(conn, %{"items" => [], "pagination" => %{"total_count" => 0, "max_page" => 0}})
end)

{:ok, %Polarex.ListResourceProduct{items: []}} = Polarex.Products.products_list([])
```

### Errors

Every failure returns `{:error, %Polarex.Error{}}` with the HTTP `status`, a
human-readable `message`, the raw `body`, and on 422s the decoded
`validation_errors`:

```elixir
{:error, %Polarex.Error{status: 422, validation_errors: [%Polarex.ValidationError{loc: ["body", "email"]} | _]}} =
  Polarex.Customers.customers_create(%Polarex.CustomerIndividualCreate{email: "not-an-email"})
```

Transport failures (the request never got a response) have `status: nil` and
the `reason` (e.g. `:econnrefused`). Empty success bodies such as `204 No
Content` return `{:ok, nil}`.

### Retries

Only GET requests are retried automatically (`retry: :safe_transient`).
Mutating requests (POST/PATCH/PUT/DELETE) are never retried by the library,
since repeating them can duplicate side effects such as checkouts. Opt in
explicitly through `req_options` if an endpoint is safe for your use case:

```elixir
# retry this delete (idempotent on Polar's side) up to 3 times
Polarex.Customers.customers_delete("customer-id", req_options: [retry: :transient, max_retries: 3])
```

Any [`Req` retry option](https://hexdocs.pm/req/Req.Steps.html#retry/1) works,
including a custom `retry: fn request, response_or_error -> ... end`.

### Telemetry

Every request emits `[:polarex, :request, :start | :stop | :exception]`
telemetry events. The metadata includes `:operation` (e.g.
`{Polarex.Checkouts, :checkouts_create}`), `:method` and `:url`, so you can
attach handlers for logging or metrics without wrapping the client.

### API versioning

Polar versions its API by date (e.g. `2026-04`) and selects the version by
SDK generation rather than an HTTP header: the behavior you get matches the
OpenAPI spec this library was generated from. Check the `info.version` field
of the bundled `openapi.json` for the current one.

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



defmodule Polarex.Meters do
  @moduledoc """
  Provides API endpoints related to meters
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Meter

  Create a meter.

  **Scopes**: `meters:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec meters_create(body :: Polarex.MeterCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Meter.t()} | {:error, Polarex.HTTPValidationError.t()}
  def meters_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Meters, :meters_create},
      url: "/v1/meters/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.MeterCreate, :t}}],
      response: [{201, {Polarex.Meter, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Meter

  Get a meter by ID.

  **Scopes**: `meters:read` `meters:write`
  """
  @spec meters_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Meter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Meters, :meters_get},
      url: "/v1/meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Meter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Meters

  List meters.

  **Scopes**: `meters:read` `meters:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `query`: Filter by name.
    * `is_archived`: Filter on archived meters.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec meters_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceMeter.t()} | {:error, Polarex.HTTPValidationError.t()}
  def meters_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :is_archived,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :query,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Meters, :meters_list},
      url: "/v1/meters/",
      method: :get,
      query: query,
      response: [{200, {Polarex.ListResourceMeter, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Meter Quantities

  Get quantities of a meter over a time period.

  **Scopes**: `meters:read` `meters:write`

  ## Options

    * `start_timestamp`: Start timestamp.
    * `end_timestamp`: End timestamp.
    * `interval`: Interval between two timestamps.
    * `timezone`: Timezone to use for the timestamps. Default is UTC.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `customer_aggregation_function`: If set, will first compute the quantities per customer before aggregating them using the given function. If not set, the quantities will be aggregated across all events.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec meters_quantities(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.MeterQuantities.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def meters_quantities(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_aggregation_function,
        :customer_id,
        :end_timestamp,
        :external_customer_id,
        :interval,
        :metadata,
        :start_timestamp,
        :timezone
      ])

    client.request(%{
      args: [id: id],
      call: {Polarex.Meters, :meters_quantities},
      url: "/v1/meters/#{id}/quantities",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.MeterQuantities, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Meter

  Update a meter.

  **Scopes**: `meters:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec meters_update(id :: String.t(), body :: Polarex.MeterUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Meter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def meters_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Meters, :meters_update},
      url: "/v1/meters/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.MeterUpdate, :t}}],
      response: [
        {200, {Polarex.Meter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

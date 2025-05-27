defmodule Polarex.Generated.CustomerMeters do
  @moduledoc """
  Provides API endpoints related to customer meters
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Customer Meter

  Get a customer meter by ID.

  **Scopes**: `customer_meters:read`
  """
  @spec customer_meters_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerMeter.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CustomerMeters, :customer_meters_get},
      url: "/v1/customer-meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerMeter, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Customer Meters

  List customer meters.

  **Scopes**: `customer_meters:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `meter_id`: Filter by meter ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_meters_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCustomerMeter.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_meters_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :limit,
        :meter_id,
        :organization_id,
        :page,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.CustomerMeters, :customer_meters_list},
      url: "/v1/customer-meters/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomerMeter, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer Meter

  Get a meter by ID for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_meters_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerCustomerMeter.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CustomerMeters, :customer_portal_customer_meters_get},
      url: "/v1/customer-portal/meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerCustomerMeter, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Meters

  List meters of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `meter_id`: Filter by meter ID.
    * `query`: Filter by meter name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_customer_meters_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCustomerCustomerMeter.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_customer_meters_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :meter_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.CustomerMeters, :customer_portal_customer_meters_list},
      url: "/v1/customer-portal/meters/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomerCustomerMeter, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

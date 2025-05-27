defmodule Polarex.Generated.Orders do
  @moduledoc """
  Provides API endpoints related to orders
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Order

  Get an order by ID for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_orders_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerOrder.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Orders, :customer_portal_orders_get},
      url: "/v1/customer-portal/orders/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerOrder, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order Invoice

  Get an order's invoice data.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_orders_invoice(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerOrderInvoice.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Orders, :customer_portal_orders_invoice},
      url: "/v1/customer-portal/orders/#{id}/invoice",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerOrderInvoice, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Orders

  List orders of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `product_billing_type`: Filter by product billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `subscription_id`: Filter by subscription ID.
    * `query`: Search by product or organization name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_orders_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCustomerOrder.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_orders_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :organization_id,
        :page,
        :product_billing_type,
        :product_id,
        :query,
        :sorting,
        :subscription_id
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Orders, :customer_portal_orders_list},
      url: "/v1/customer-portal/orders/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomerOrder, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order

  Get an order by ID.

  **Scopes**: `orders:read`
  """
  @spec orders_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Order.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Orders, :orders_get},
      url: "/v1/orders/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Order, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order Invoice

  Get an order's invoice data.

  **Scopes**: `orders:read`
  """
  @spec orders_invoice(String.t(), keyword) ::
          {:ok, Polarex.Generated.OrderInvoice.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Orders, :orders_invoice},
      url: "/v1/orders/#{id}/invoice",
      method: :get,
      response: [
        {200, {Polarex.Generated.OrderInvoice, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Orders

  List orders.

  **Scopes**: `orders:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `product_billing_type`: Filter by product billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `discount_id`: Filter by discount ID.
    * `customer_id`: Filter by customer ID.
    * `checkout_id`: Filter by checkout ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec orders_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceOrder.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def orders_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :checkout_id,
        :customer_id,
        :discount_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_billing_type,
        :product_id,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Orders, :orders_list},
      url: "/v1/orders/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceOrder, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

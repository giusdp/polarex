defmodule Polarex.Mcp do
  @moduledoc """
  Provides API endpoints related to mcp
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Customer Meter

  Get a customer meter by ID.

  **Scopes**: `customer_meters:read`
  """
  @spec customer_meters_get(String.t(), keyword) ::
          {:ok, Polarex.CustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customer_meters_get},
      url: "/v1/customer-meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerMeter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.ListResourceCustomerMeter.t()} | {:error, Polarex.HTTPValidationError.t()}
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
      call: {Polarex.Mcp, :customer_meters_list},
      url: "/v1/customer-meters/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerMeter, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Customer

  Create a customer.

  **Scopes**: `customers:write`
  """
  @spec customers_create(Polarex.CustomerCreate.t(), keyword) ::
          {:ok, Polarex.Customer.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customers_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Mcp, :customers_create},
      url: "/v1/customers/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerCreate, :t}}],
      response: [{201, {Polarex.Customer, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Customer

  Delete a customer.

  This action cannot be undone and will immediately:
  - Cancel any active subscriptions for the customer
  - Revoke all their benefits
  - Clear any `external_id`

  Use it only in the context of deleting a user within your
  own service. Otherwise, use more granular API endpoints to cancel
  a specific subscription or revoke certain benefits.

  Note: The customers information will nonetheless be retained for historic
  orders and subscriptions.

  **Scopes**: `customers:write`
  """
  @spec customers_delete(String.t(), keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customers_delete},
      url: "/v1/customers/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Customer by External ID

  Delete a customer by external ID.

  Immediately cancels any active subscriptions and revokes any active benefits.

  **Scopes**: `customers:write`
  """
  @spec customers_delete_external(String.t(), keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_delete_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Mcp, :customers_delete_external},
      url: "/v1/customers/external/#{external_id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer

  Get a customer by ID.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get(String.t(), keyword) ::
          {:ok, Polarex.Customer.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customers_get},
      url: "/v1/customers/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Customer, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer by External ID

  Get a customer by external ID.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get_external(String.t(), keyword) ::
          {:ok, Polarex.Customer.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Mcp, :customers_get_external},
      url: "/v1/customers/external/#{external_id}",
      method: :get,
      response: [
        {200, {Polarex.Customer, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer State

  Get a customer state by ID.

  The customer state includes information about
  the customer's active subscriptions and benefits.

  It's the ideal endpoint to use when you need to get a full overview
  of a customer's status.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get_state(String.t(), keyword) ::
          {:ok, Polarex.CustomerState.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_state(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customers_get_state},
      url: "/v1/customers/#{id}/state",
      method: :get,
      response: [
        {200, {Polarex.CustomerState, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer State by External ID

  Get a customer state by external ID.

  The customer state includes information about
  the customer's active subscriptions and benefits.

  It's the ideal endpoint to use when you need to get a full overview
  of a customer's status.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get_state_external(String.t(), keyword) ::
          {:ok, Polarex.CustomerState.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_state_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Mcp, :customers_get_state_external},
      url: "/v1/customers/external/#{external_id}/state",
      method: :get,
      response: [
        {200, {Polarex.CustomerState, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Customers

  List customers.

  **Scopes**: `customers:read` `customers:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `email`: Filter by exact email.
    * `query`: Filter by name or email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec customers_list(keyword) ::
          {:ok, Polarex.ListResourceCustomer.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customers_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:email, :limit, :metadata, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :customers_list},
      url: "/v1/customers/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomer, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer

  Update a customer.

  **Scopes**: `customers:write`
  """
  @spec customers_update(String.t(), Polarex.CustomerUpdate.t(), keyword) ::
          {:ok, Polarex.Customer.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :customers_update},
      url: "/v1/customers/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerUpdate, :t}}],
      response: [
        {200, {Polarex.Customer, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer by External ID

  Update a customer by external ID.

  **Scopes**: `customers:write`
  """
  @spec customers_update_external(String.t(), Polarex.CustomerUpdateExternalID.t(), keyword) ::
          {:ok, Polarex.Customer.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_update_external(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Polarex.Mcp, :customers_update_external},
      url: "/v1/customers/external/#{external_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerUpdateExternalID, :t}}],
      response: [
        {200, {Polarex.Customer, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Metrics

  Get metrics about your orders and subscriptions.

  Currency values are output in cents.

  **Scopes**: `metrics:read`

  ## Options

    * `start_date`: Start date.
    * `end_date`: End date.
    * `interval`: Interval between two timestamps.
    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `billing_type`: Filter by billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `customer_id`: Filter by customer ID.

  """
  @spec metrics_get(keyword) ::
          {:ok, Polarex.MetricsResponse.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_get(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billing_type,
        :customer_id,
        :end_date,
        :interval,
        :organization_id,
        :product_id,
        :start_date
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :metrics_get},
      url: "/v1/metrics/",
      method: :get,
      query: query,
      response: [{200, {Polarex.MetricsResponse, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Metrics Limits

  Get the interval limits for the metrics endpoint.

  **Scopes**: `metrics:read`
  """
  @spec metrics_limits(keyword) :: {:ok, Polarex.MetricsLimits.t()} | :error
  def metrics_limits(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :metrics_limits},
      url: "/v1/metrics/limits",
      method: :get,
      response: [{200, {Polarex.MetricsLimits, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Order

  Get an order by ID.

  **Scopes**: `orders:read`
  """
  @spec orders_get(String.t(), keyword) ::
          {:ok, Polarex.Order.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :orders_get},
      url: "/v1/orders/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Order, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.OrderInvoice.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :orders_invoice},
      url: "/v1/orders/#{id}/invoice",
      method: :get,
      response: [
        {200, {Polarex.OrderInvoice, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.ListResourceOrder.t()} | {:error, Polarex.HTTPValidationError.t()}
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
      call: {Polarex.Mcp, :orders_list},
      url: "/v1/orders/",
      method: :get,
      query: query,
      response: [{200, {Polarex.ListResourceOrder, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Payment

  Get a payment by ID.

  **Scopes**: `payments:read`
  """
  @spec payments_get(String.t(), keyword) ::
          {:ok, Polarex.CardPayment.t() | Polarex.GenericPayment.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def payments_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :payments_get},
      url: "/v1/payments/#{id}",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CardPayment, :t}, {Polarex.GenericPayment, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Payments

  List payments.

  **Scopes**: `payments:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `checkout_id`: Filter by checkout ID.
    * `order_id`: Filter by order ID.
    * `status`: Filter by payment status.
    * `method`: Filter by payment method.
    * `customer_email`: Filter by customer email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec payments_list(keyword) ::
          {:ok, Polarex.ListResource.t()} | {:error, Polarex.HTTPValidationError.t()}
  def payments_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :checkout_id,
        :customer_email,
        :limit,
        :method,
        :order_id,
        :organization_id,
        :page,
        :sorting,
        :status
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :payments_list},
      url: "/v1/payments/",
      method: :get,
      query: query,
      response: [{200, {Polarex.ListResource, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Create Product

  Create a product.

  **Scopes**: `products:write`
  """
  @spec products_create(Polarex.ProductCreate.t(), keyword) ::
          {:ok, Polarex.Product.t()} | {:error, Polarex.HTTPValidationError.t()}
  def products_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Mcp, :products_create},
      url: "/v1/products/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.ProductCreate, :t}}],
      response: [{201, {Polarex.Product, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Product

  Get a product by ID.

  **Scopes**: `products:read` `products:write`
  """
  @spec products_get(String.t(), keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def products_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :products_get},
      url: "/v1/products/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Product, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Products

  List products.

  **Scopes**: `products:read` `products:write`

  ## Options

    * `id`: Filter by product ID.
    * `organization_id`: Filter by organization ID.
    * `query`: Filter by product name.
    * `is_archived`: Filter on archived products.
    * `is_recurring`: Filter on recurring products. If `true`, only subscriptions tiers are returned. If `false`, only one-time purchase products are returned. 
    * `benefit_id`: Filter products granting specific benefit.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec products_list(keyword) ::
          {:ok, Polarex.ListResourceProduct.t()} | {:error, Polarex.HTTPValidationError.t()}
  def products_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :benefit_id,
        :id,
        :is_archived,
        :is_recurring,
        :limit,
        :organization_id,
        :page,
        :query,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :products_list},
      url: "/v1/products/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceProduct, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product

  Update a product.

  **Scopes**: `products:write`
  """
  @spec products_update(String.t(), Polarex.ProductUpdate.t(), keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def products_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :products_update},
      url: "/v1/products/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.ProductUpdate, :t}}],
      response: [
        {200, {Polarex.Product, :t}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product Benefits

  Update benefits granted by a product.

  **Scopes**: `products:write`
  """
  @spec products_update_benefits(String.t(), Polarex.ProductBenefitsUpdate.t(), keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def products_update_benefits(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :products_update_benefits},
      url: "/v1/products/#{id}/benefits",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.ProductBenefitsUpdate, :t}}],
      response: [
        {200, {Polarex.Product, :t}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Export Subscriptions

  Export subscriptions as a CSV file.

  **Scopes**: `subscriptions:read` `subscriptions:write`

  ## Options

    * `organization_id`: Filter by organization ID.

  """
  @spec subscriptions_export(keyword) :: {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :subscriptions_export},
      url: "/v1/subscriptions/export",
      method: :get,
      query: query,
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription by ID.

  **Scopes**: `subscriptions:write`
  """
  @spec subscriptions_get(String.t(), keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :subscriptions_get},
      url: "/v1/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Subscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Subscriptions

  List subscriptions.

  **Scopes**: `subscriptions:read` `subscriptions:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `customer_id`: Filter by customer ID.
    * `discount_id`: Filter by discount ID.
    * `active`: Filter by active or inactive subscription.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec subscriptions_list(keyword) ::
          {:ok, Polarex.ListResourceSubscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :active,
        :customer_id,
        :discount_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_id,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :subscriptions_list},
      url: "/v1/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceSubscription, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Revoke Subscription

  Revoke a subscription, i.e cancel immediately.

  **Scopes**: `subscriptions:write`
  """
  @spec subscriptions_revoke(String.t(), keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def subscriptions_revoke(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :subscriptions_revoke},
      url: "/v1/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.Subscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Subscription

  Update a subscription.

  **Scopes**: `subscriptions:write`
  """
  @spec subscriptions_update(
          String.t(),
          Polarex.SubscriptionCancel.t()
          | Polarex.SubscriptionRevoke.t()
          | Polarex.SubscriptionUpdateProduct.t(),
          keyword
        ) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :subscriptions_update},
      url: "/v1/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCancel, :t},
            {Polarex.SubscriptionRevoke, :t},
            {Polarex.SubscriptionUpdateProduct, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.Subscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

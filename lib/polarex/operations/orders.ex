defmodule Polarex.Orders do
  @moduledoc """
  Provides API endpoints related to orders
  """

  @default_client Polarex.Support.Client

  @doc """
  Confirm Retry Payment

  Confirm a retry payment using a Stripe confirmation token.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_orders_confirm_retry_payment(
          id :: String.t(),
          body :: Polarex.CustomerOrderConfirmPayment.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerOrderPaymentConfirmation.t()}
          | {:error,
             Polarex.ManualRetryLimitExceeded.t()
             | Polarex.OrderNotEligibleForRetry.t()
             | Polarex.PaymentAlreadyInProgress.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_confirm_retry_payment(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Orders, :customer_portal_orders_confirm_retry_payment},
      url: "/v1/customer-portal/orders/#{id}/confirm-payment",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerOrderConfirmPayment, :t}}],
      response: [
        {200, {Polarex.CustomerOrderPaymentConfirmation, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.PaymentAlreadyInProgress, :t}},
        {422, {Polarex.OrderNotEligibleForRetry, :t}},
        {429, {Polarex.ManualRetryLimitExceeded, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate Order Invoice

  Trigger generation of an order's invoice.
  """
  @spec customer_portal_orders_generate_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, map}
          | {:error, Polarex.MissingInvoiceBillingDetails.t() | Polarex.NotPaidOrder.t()}
  def customer_portal_orders_generate_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :customer_portal_orders_generate_invoice},
      url: "/v1/customer-portal/orders/#{id}/invoice",
      method: :post,
      response: [
        {202, :map},
        {422, {:union, [{Polarex.MissingInvoiceBillingDetails, :t}, {Polarex.NotPaidOrder, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order

  Get an order by ID for the authenticated customer.
  """
  @spec customer_portal_orders_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerOrder.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :customer_portal_orders_get},
      url: "/v1/customer-portal/orders/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerOrder, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order Payment Status

  Get the current payment status for an order.
  """
  @spec customer_portal_orders_get_payment_status(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerOrderPaymentStatus.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_get_payment_status(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :customer_portal_orders_get_payment_status},
      url: "/v1/customer-portal/orders/#{id}/payment-status",
      method: :get,
      response: [
        {200, {Polarex.CustomerOrderPaymentStatus, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order Invoice

  Get an order's invoice data.
  """
  @spec customer_portal_orders_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerOrderInvoice.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :customer_portal_orders_invoice},
      url: "/v1/customer-portal/orders/#{id}/invoice",
      method: :get,
      response: [
        {200, {Polarex.CustomerOrderInvoice, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Orders

  List orders of the authenticated customer.

  ## Options

    * `product_id`: Filter by product ID.
    * `product_billing_type`: Filter by product billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `subscription_id`: Filter by subscription ID.
    * `query`: Search by product or organization name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_orders_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerOrder.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_orders_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :page,
        :product_billing_type,
        :product_id,
        :query,
        :sorting,
        :subscription_id
      ])

    client.request(%{
      args: [],
      call: {Polarex.Orders, :customer_portal_orders_list},
      url: "/v1/customer-portal/orders/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerOrder, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order Receipt

  Get a presigned URL to download an order's receipt PDF.
  """
  @spec customer_portal_orders_receipt(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerOrderReceipt.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_receipt(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :customer_portal_orders_receipt},
      url: "/v1/customer-portal/orders/#{id}/receipt",
      method: :get,
      response: [
        {200, {Polarex.CustomerOrderReceipt, :t}},
        {202, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Order

  Update an order for the authenticated customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_orders_update(
          id :: String.t(),
          body :: Polarex.CustomerOrderUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerOrder.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Orders, :customer_portal_orders_update},
      url: "/v1/customer-portal/orders/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerOrderUpdate, :t}}],
      response: [
        {200, {Polarex.CustomerOrder, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Order

  Create a draft order for an off-session charge against a saved payment
  method. The order is created with `status=draft` and no invoice number;
  call `POST /v1/orders/{id}/finalize` to attempt the charge.

  The organization must have the `off_session_charges_enabled` feature flag.

  **Scopes**: `orders:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec orders_create(body :: Polarex.OrderCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Order.t()} | {:error, Polarex.HTTPValidationError.t()}
  def orders_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Orders, :orders_create},
      url: "/v1/orders/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.OrderCreate, :t}}],
      response: [{201, {Polarex.Order, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Export Orders

  Export orders as a CSV file.

  **Scopes**: `orders:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.

  """
  @spec orders_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def orders_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id, :product_id])

    client.request(%{
      args: [],
      call: {Polarex.Orders, :orders_export},
      url: "/v1/orders/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Finalize Order

  Finalize a draft order and synchronously attempt an off-session charge.

  On success, the order transitions to `paid` and benefit grants fire
  before the response returns. On failure (decline, missing payment method,
  SCA challenge), the order stays in `draft` and a 4xx error is returned.

  The request fails with 412 if the order is not in `draft` status.

  **Scopes**: `orders:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec orders_finalize(id :: String.t(), body :: Polarex.OrderFinalize.t(), opts :: keyword) ::
          {:ok, Polarex.Order.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.OffSessionChargesNotEnabled.t()
             | Polarex.OrderNotDraft.t()
             | Polarex.OrganizationNotReadyForPayments.t()
             | Polarex.PaymentActionRequired.t()
             | Polarex.PaymentFailed.t()
             | Polarex.ResourceNotFound.t()}
  def orders_finalize(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Orders, :orders_finalize},
      url: "/v1/orders/#{id}/finalize",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.OrderFinalize, :t}}],
      response: [
        {200, {Polarex.Order, :t}},
        {402, {:union, [{Polarex.PaymentActionRequired, :t}, {Polarex.PaymentFailed, :t}]}},
        {403,
         {:union,
          [
            {Polarex.OffSessionChargesNotEnabled, :t},
            {Polarex.OrganizationNotReadyForPayments, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {412, {Polarex.OrderNotDraft, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate Order Invoice

  Trigger generation of an order's invoice.

  **Scopes**: `orders:read`
  """
  @spec orders_generate_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, map}
          | {:error, Polarex.MissingInvoiceBillingDetails.t() | Polarex.NotPaidOrder.t()}
  def orders_generate_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :orders_generate_invoice},
      url: "/v1/orders/#{id}/invoice",
      method: :post,
      response: [
        {202, :map},
        {422, {:union, [{Polarex.MissingInvoiceBillingDetails, :t}, {Polarex.NotPaidOrder, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order

  Get an order by ID.

  **Scopes**: `orders:read`
  """
  @spec orders_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Order.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :orders_get},
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
  @spec orders_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.OrderInvoice.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :orders_invoice},
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
    * `external_customer_id`: Filter by customer external ID.
    * `checkout_id`: Filter by checkout ID.
    * `subscription_id`: Filter by subscription ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec orders_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceOrder.t()} | {:error, Polarex.HTTPValidationError.t()}
  def orders_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :checkout_id,
        :customer_id,
        :discount_id,
        :external_customer_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_billing_type,
        :product_id,
        :sorting,
        :subscription_id
      ])

    client.request(%{
      args: [],
      call: {Polarex.Orders, :orders_list},
      url: "/v1/orders/",
      method: :get,
      query: query,
      response: [{200, {Polarex.ListResourceOrder, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Order Receipt

  Get a presigned URL to download an order's receipt PDF.

  **Scopes**: `orders:read`
  """
  @spec orders_receipt(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.OrderReceipt.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_receipt(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Orders, :orders_receipt},
      url: "/v1/orders/#{id}/receipt",
      method: :get,
      response: [
        {200, {Polarex.OrderReceipt, :t}},
        {202, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Order

  Update an order.

  **Scopes**: `orders:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec orders_update(id :: String.t(), body :: Polarex.OrderUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Order.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Orders, :orders_update},
      url: "/v1/orders/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.OrderUpdate, :t}}],
      response: [
        {200, {Polarex.Order, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

defmodule Polarex.Generated.Customers do
  @moduledoc """
  Provides API endpoints related to customers
  """

  @default_client Polarex.Support.Client

  @doc """
  Add Customer Payment Method

  Add a payment method to the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_add_payment_method(
          Polarex.Generated.CustomerPaymentMethodCreate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.PaymentMethodCard.t() | Polarex.Generated.PaymentMethodGeneric.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_customers_add_payment_method(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Customers, :customer_portal_customers_add_payment_method},
      url: "/v1/customer-portal/customers/me/payment-methods",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.CustomerPaymentMethodCreate, :t}}],
      response: [
        {201,
         {:union,
          [
            {Polarex.Generated.PaymentMethodCard, :t},
            {Polarex.Generated.PaymentMethodGeneric, :t}
          ]}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Customer Payment Method

  Delete a payment method from the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_delete_payment_method(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_customers_delete_payment_method(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Customers, :customer_portal_customers_delete_payment_method},
      url: "/v1/customer-portal/customers/me/payment-methods/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer

  Get authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_get(keyword) ::
          {:ok, Polarex.Generated.CustomerPortalCustomer.t()} | :error
  def customer_portal_customers_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Generated.Customers, :customer_portal_customers_get},
      url: "/v1/customer-portal/customers/me",
      method: :get,
      response: [{200, {Polarex.Generated.CustomerPortalCustomer, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Customer Payment Methods

  Get saved payment methods of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_customers_get_payment_methods(keyword) ::
          {:ok, Polarex.Generated.ListResourceUnionPaymentMethodCardPaymentMethodGeneric.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_customers_get_payment_methods(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Customers, :customer_portal_customers_get_payment_methods},
      url: "/v1/customer-portal/customers/me/payment-methods",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceUnionPaymentMethodCardPaymentMethodGeneric, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer

  Update authenticated customer.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_customers_update(
          Polarex.Generated.CustomerPortalCustomerUpdate.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.CustomerPortalCustomer.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_customers_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Customers, :customer_portal_customers_update},
      url: "/v1/customer-portal/customers/me",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CustomerPortalCustomerUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.CustomerPortalCustomer, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Customer

  Create a customer.

  **Scopes**: `customers:write`
  """
  @spec customers_create(Polarex.Generated.CustomerCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Customer.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customers_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Customers, :customers_create},
      url: "/v1/customers/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.CustomerCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Customer, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
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
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Customers, :customers_delete},
      url: "/v1/customers/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_delete_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Generated.Customers, :customers_delete_external},
      url: "/v1/customers/external/#{external_id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.Customer.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Customers, :customers_get},
      url: "/v1/customers/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Customer, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.Customer.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_get_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Generated.Customers, :customers_get_external},
      url: "/v1/customers/external/#{external_id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Customer, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.CustomerState.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_get_state(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Customers, :customers_get_state},
      url: "/v1/customers/#{id}/state",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerState, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.CustomerState.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_get_state_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Generated.Customers, :customers_get_state_external},
      url: "/v1/customers/external/#{external_id}/state",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerState, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.ListResourceCustomer.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customers_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:email, :limit, :metadata, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Customers, :customers_list},
      url: "/v1/customers/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomer, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer

  Update a customer.

  **Scopes**: `customers:write`
  """
  @spec customers_update(String.t(), Polarex.Generated.CustomerUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Customer.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Customers, :customers_update},
      url: "/v1/customers/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CustomerUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Customer, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer by External ID

  Update a customer by external ID.

  **Scopes**: `customers:write`
  """
  @spec customers_update_external(
          String.t(),
          Polarex.Generated.CustomerUpdateExternalID.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.Customer.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customers_update_external(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Polarex.Generated.Customers, :customers_update_external},
      url: "/v1/customers/external/#{external_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CustomerUpdateExternalID, :t}}],
      response: [
        {200, {Polarex.Generated.Customer, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

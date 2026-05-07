defmodule Polarex.Customers do
  @moduledoc """
  Provides API endpoints related to customers
  """

  @default_client Polarex.Support.Client

  @doc """
  Add Customer Payment Method

  Add a payment method to the authenticated customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_customers_add_payment_method(
          body :: Polarex.CustomerPaymentMethodCreate.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.CustomerPaymentMethodCreateRequiresActionResponse.t()
           | Polarex.CustomerPaymentMethodCreateSucceededResponse.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_add_payment_method(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Customers, :customer_portal_customers_add_payment_method},
      url: "/v1/customer-portal/customers/me/payment-methods",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerPaymentMethodCreate, :t}}],
      response: [
        {201,
         {:union,
          [
            {Polarex.CustomerPaymentMethodCreateRequiresActionResponse, :t},
            {Polarex.CustomerPaymentMethodCreateSucceededResponse, :t}
          ]}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Check Email Change Token

  Check if an email change verification token is still valid.

  ## Options

    * `token`

  """
  @spec customer_portal_customers_check_email_update(opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_check_email_update(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {Polarex.Customers, :customer_portal_customers_check_email_update},
      url: "/v1/customer-portal/customers/me/email-update/check",
      method: :get,
      query: query,
      response: [{204, :null}, {401, :null}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Confirm Customer Payment Method

  Confirm a payment method for the authenticated customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_customers_confirm_payment_method(
          body :: Polarex.CustomerPaymentMethodConfirm.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.CustomerPaymentMethodCreateRequiresActionResponse.t()
           | Polarex.CustomerPaymentMethodCreateSucceededResponse.t()}
          | {:error, Polarex.CustomerNotReady.t() | Polarex.HTTPValidationError.t()}
  def customer_portal_customers_confirm_payment_method(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Customers, :customer_portal_customers_confirm_payment_method},
      url: "/v1/customer-portal/customers/me/payment-methods/confirm",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerPaymentMethodConfirm, :t}}],
      response: [
        {201,
         {:union,
          [
            {Polarex.CustomerPaymentMethodCreateRequiresActionResponse, :t},
            {Polarex.CustomerPaymentMethodCreateSucceededResponse, :t}
          ]}},
        {400, {Polarex.CustomerNotReady, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Customer Payment Method

  Delete a payment method from the authenticated customer.
  """
  @spec customer_portal_customers_delete_payment_method(id :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.PaymentMethodInUseByActiveSubscription.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_customers_delete_payment_method(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Customers, :customer_portal_customers_delete_payment_method},
      url: "/v1/customer-portal/customers/me/payment-methods/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Polarex.PaymentMethodInUseByActiveSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer

  Get authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_get(opts :: keyword) ::
          {:ok, Polarex.CustomerPortalCustomer.t()} | :error
  def customer_portal_customers_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Customers, :customer_portal_customers_get},
      url: "/v1/customer-portal/customers/me",
      method: :get,
      response: [{200, {Polarex.CustomerPortalCustomer, :t}}],
      opts: opts
    })
  end

  @doc """
  List Customer Payment Methods

  Get saved payment methods of the authenticated customer.

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_customers_list_payment_methods(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerPaymentMethod.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_list_payment_methods(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Customers, :customer_portal_customers_list_payment_methods},
      url: "/v1/customer-portal/customers/me/payment-methods",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerPaymentMethod, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Request Email Change

  Request an email change for the authenticated customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_customers_request_email_update(
          body :: Polarex.CustomerEmailUpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_request_email_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Customers, :customer_portal_customers_request_email_update},
      url: "/v1/customer-portal/customers/me/email-update/request",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerEmailUpdateRequest, :t}}],
      response: [{202, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update Customer

  Update authenticated customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_customers_update(
          body :: Polarex.CustomerPortalCustomerUpdate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerPortalCustomer.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Customers, :customer_portal_customers_update},
      url: "/v1/customer-portal/customers/me",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerPortalCustomerUpdate, :t}}],
      response: [
        {200, {Polarex.CustomerPortalCustomer, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Verify Email Change

  Verify an email change using the token from the verification email.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_customers_verify_email_update(
          body :: Polarex.CustomerEmailUpdateVerifyRequest.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerEmailUpdateVerifyResponse.t()} | :error
  def customer_portal_customers_verify_email_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Customers, :customer_portal_customers_verify_email_update},
      url: "/v1/customer-portal/customers/me/email-update/verify",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerEmailUpdateVerifyRequest, :t}}],
      response: [
        {200, {Polarex.CustomerEmailUpdateVerifyResponse, :t}},
        {401, :null},
        {422, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Create Customer

  Create a customer.

  **Scopes**: `customers:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customers_create(
          body :: Polarex.CustomerIndividualCreate.t() | Polarex.CustomerTeamCreate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customers_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Customers, :customers_create},
      url: "/v1/customers/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{Polarex.CustomerIndividualCreate, :t}, {Polarex.CustomerTeamCreate, :t}]}}
      ],
      response: [
        {201, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {422, {Polarex.HTTPValidationError, :t}}
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

  Set `anonymize=true` to also anonymize PII for GDPR compliance.

  **Scopes**: `customers:write`

  ## Options

    * `anonymize`: If true, also anonymize the customer's personal data for GDPR compliance. This replaces email with a hashed version, hashes name and billing name (name preserved for businesses with tax_id), clears billing address, and removes OAuth account data.

  """
  @spec customers_delete(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_delete(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:anonymize])

    client.request(%{
      args: [id: id],
      call: {Polarex.Customers, :customers_delete},
      url: "/v1/customers/#{id}",
      method: :delete,
      query: query,
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

  Set `anonymize=true` to also anonymize PII for GDPR compliance.

  **Scopes**: `customers:write`

  ## Options

    * `anonymize`: If true, also anonymize the customer's personal data for GDPR compliance.

  """
  @spec customers_delete_external(external_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_delete_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:anonymize])

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Customers, :customers_delete_external},
      url: "/v1/customers/external/#{external_id}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Export Customers

  Export customers as a CSV file.

  **Scopes**: `customers:read` `customers:write`

  ## Options

    * `organization_id`: Filter by organization ID.

  """
  @spec customers_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customers_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Customers, :customers_export},
      url: "/v1/customers/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Customer

  Get a customer by ID.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Customers, :customers_get},
      url: "/v1/customers/#{id}",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
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
  @spec customers_get_external(external_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Customers, :customers_get_external},
      url: "/v1/customers/external/#{external_id}",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
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
  @spec customers_get_state(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerStateIndividual.t() | Polarex.CustomerStateTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_state(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Customers, :customers_get_state},
      url: "/v1/customers/#{id}/state",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerStateIndividual, :t}, {Polarex.CustomerStateTeam, :t}]}},
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
  @spec customers_get_state_external(external_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerStateIndividual.t() | Polarex.CustomerStateTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_state_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Customers, :customers_get_state_external},
      url: "/v1/customers/external/#{external_id}/state",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerStateIndividual, :t}, {Polarex.CustomerStateTeam, :t}]}},
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
    * `query`: Filter by name, email, or external ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec customers_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomer.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customers_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:email, :limit, :metadata, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Customers, :customers_list},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customers_update(id :: String.t(), body :: Polarex.CustomerUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Customers, :customers_update},
      url: "/v1/customers/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerUpdate, :t}}],
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customers_update_external(
          external_id :: String.t(),
          body :: Polarex.CustomerUpdateExternalID.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_update_external(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Polarex.Customers, :customers_update_external},
      url: "/v1/customers/external/#{external_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerUpdateExternalID, :t}}],
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

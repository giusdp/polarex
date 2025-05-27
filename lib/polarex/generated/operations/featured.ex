defmodule Polarex.Generated.Featured do
  @moduledoc """
  Provides API endpoints related to featured
  """

  @default_client Polarex.Support.Client

  @doc """
  Confirm Checkout Session from Client

  Confirm a checkout session by client secret.

  Orders and subscriptions will be processed.
  """
  @spec checkouts_client_confirm(String.t(), Polarex.Generated.CheckoutConfirmStripe.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutPublicConfirmed.t()}
          | {:error,
             Polarex.Generated.AlreadyActiveSubscriptionError.t()
             | Polarex.Generated.ExpiredCheckoutError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotOpenCheckout.t()
             | Polarex.Generated.PaymentError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_client_confirm(client_secret, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret, body: body],
      call: {Polarex.Generated.Featured, :checkouts_client_confirm},
      url: "/v1/checkouts/client/#{client_secret}/confirm",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.CheckoutConfirmStripe, :t}}],
      response: [
        {200, {Polarex.Generated.CheckoutPublicConfirmed, :t}},
        {400, {Polarex.Generated.PaymentError, :t}},
        {403,
         {:union,
          [
            {Polarex.Generated.AlreadyActiveSubscriptionError, :t},
            {Polarex.Generated.NotOpenCheckout, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {410, {Polarex.Generated.ExpiredCheckoutError, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Checkout Session from Client

  Get a checkout session by client secret.
  """
  @spec checkouts_client_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutPublic.t()}
          | {:error,
             Polarex.Generated.ExpiredCheckoutError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_client_get(client_secret, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret],
      call: {Polarex.Generated.Featured, :checkouts_client_get},
      url: "/v1/checkouts/client/#{client_secret}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CheckoutPublic, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {410, {Polarex.Generated.ExpiredCheckoutError, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Session from Client

  Update a checkout session by client secret.
  """
  @spec checkouts_client_update(String.t(), Polarex.Generated.CheckoutUpdatePublic.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutPublic.t()}
          | {:error,
             Polarex.Generated.AlreadyActiveSubscriptionError.t()
             | Polarex.Generated.ExpiredCheckoutError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotOpenCheckout.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_client_update(client_secret, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret, body: body],
      call: {Polarex.Generated.Featured, :checkouts_client_update},
      url: "/v1/checkouts/client/#{client_secret}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CheckoutUpdatePublic, :t}}],
      response: [
        {200, {Polarex.Generated.CheckoutPublic, :t}},
        {403,
         {:union,
          [
            {Polarex.Generated.AlreadyActiveSubscriptionError, :t},
            {Polarex.Generated.NotOpenCheckout, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {410, {Polarex.Generated.ExpiredCheckoutError, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Checkout Session

  Create a checkout session.

  **Scopes**: `checkouts:write`
  """
  @spec checkouts_create(Polarex.Generated.CheckoutProductsCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Checkout.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkouts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :checkouts_create},
      url: "/v1/checkouts/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.CheckoutProductsCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Checkout, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Checkout Session

  Get a checkout session by ID.

  **Scopes**: `checkouts:read` `checkouts:write`
  """
  @spec checkouts_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Checkout.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :checkouts_get},
      url: "/v1/checkouts/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Checkout, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Checkout Sessions

  List checkout sessions.

  **Scopes**: `checkouts:read` `checkouts:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `customer_id`: Filter by customer ID.
    * `status`: Filter by checkout session status.
    * `query`: Filter by customer email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec checkouts_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCheckout.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkouts_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :limit,
        :organization_id,
        :page,
        :product_id,
        :query,
        :sorting,
        :status
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :checkouts_list},
      url: "/v1/checkouts/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCheckout, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Session

  Update a checkout session.

  **Scopes**: `checkouts:write`
  """
  @spec checkouts_update(String.t(), Polarex.Generated.CheckoutUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Checkout.t()}
          | {:error,
             Polarex.Generated.AlreadyActiveSubscriptionError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotOpenCheckout.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :checkouts_update},
      url: "/v1/checkouts/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CheckoutUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Checkout, :t}},
        {403,
         {:union,
          [
            {Polarex.Generated.AlreadyActiveSubscriptionError, :t},
            {Polarex.Generated.NotOpenCheckout, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

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
      call: {Polarex.Generated.Featured, :customer_meters_get},
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
      call: {Polarex.Generated.Featured, :customer_meters_list},
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
      call: {Polarex.Generated.Featured, :customer_portal_customer_meters_get},
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
      call: {Polarex.Generated.Featured, :customer_portal_customer_meters_list},
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

  @doc """
  Activate License Key

  Activate a license key instance.
  """
  @spec customer_portal_license_keys_activate(Polarex.Generated.LicenseKeyActivate.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_activate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :customer_portal_license_keys_activate},
      url: "/v1/customer-portal/license-keys/activate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.LicenseKeyActivate, :t}}],
      response: [
        {200, {Polarex.Generated.LicenseKeyActivationRead, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Deactivate License Key

  Deactivate a license key instance.
  """
  @spec customer_portal_license_keys_deactivate(
          Polarex.Generated.LicenseKeyDeactivate.t(),
          keyword
        ) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_deactivate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :customer_portal_license_keys_deactivate},
      url: "/v1/customer-portal/license-keys/deactivate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.LicenseKeyDeactivate, :t}}],
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get License Key

  Get a license key.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_license_keys_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyWithActivations.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :customer_portal_license_keys_get},
      url: "/v1/customer-portal/license-keys/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.LicenseKeyWithActivations, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List License Keys

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `benefit_id`: Filter by a specific benefit
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_license_keys_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceLicenseKeyRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def customer_portal_license_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :customer_portal_license_keys_list},
      url: "/v1/customer-portal/license-keys/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceLicenseKeyRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Validate License Key

  Validate a license key.
  """
  @spec customer_portal_license_keys_validate(Polarex.Generated.LicenseKeyValidate.t(), keyword) ::
          {:ok, Polarex.Generated.ValidatedLicenseKey.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_validate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :customer_portal_license_keys_validate},
      url: "/v1/customer-portal/license-keys/validate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.LicenseKeyValidate, :t}}],
      response: [
        {200, {Polarex.Generated.ValidatedLicenseKey, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Cancel Subscription

  Cancel a subscription of the authenticated customer.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_subscriptions_cancel(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerSubscription.t()}
          | {:error,
             Polarex.Generated.AlreadyCanceledSubscription.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_subscriptions_cancel(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :customer_portal_subscriptions_cancel},
      url: "/v1/customer-portal/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.Generated.CustomerSubscription, :t}},
        {403, {Polarex.Generated.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_subscriptions_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerSubscription.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :customer_portal_subscriptions_get},
      url: "/v1/customer-portal/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerSubscription, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Subscriptions

  List subscriptions of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `active`: Filter by active or cancelled subscription.
    * `query`: Search by product or organization name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_subscriptions_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCustomerSubscription.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:active, :limit, :organization_id, :page, :product_id, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :customer_portal_subscriptions_list},
      url: "/v1/customer-portal/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomerSubscription, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Subscription

  Update a subscription of the authenticated customer.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_subscriptions_update(
          String.t(),
          Polarex.Generated.CustomerSubscriptionCancel.t()
          | Polarex.Generated.CustomerSubscriptionUpdateProduct.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.CustomerSubscription.t()}
          | {:error,
             Polarex.Generated.AlreadyCanceledSubscription.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :customer_portal_subscriptions_update},
      url: "/v1/customer-portal/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomerSubscriptionCancel, :t},
            {Polarex.Generated.CustomerSubscriptionUpdateProduct, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.Generated.CustomerSubscription, :t}},
        {403, {Polarex.Generated.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Customer Session

  Create a customer session.

  **Scopes**: `customer_sessions:write`
  """
  @spec customer_sessions_create(
          Polarex.Generated.CustomerSessionCustomerExternalIDCreate.t()
          | Polarex.Generated.CustomerSessionCustomerIDCreate.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.CustomerSession.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_sessions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :customer_sessions_create},
      url: "/v1/customer-sessions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomerSessionCustomerExternalIDCreate, :t},
            {Polarex.Generated.CustomerSessionCustomerIDCreate, :t}
          ]}}
      ],
      response: [
        {201, {Polarex.Generated.CustomerSession, :t}},
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
      call: {Polarex.Generated.Featured, :customers_create},
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
      call: {Polarex.Generated.Featured, :customers_delete},
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
      call: {Polarex.Generated.Featured, :customers_delete_external},
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
      call: {Polarex.Generated.Featured, :customers_get},
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
      call: {Polarex.Generated.Featured, :customers_get_external},
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
      call: {Polarex.Generated.Featured, :customers_get_state},
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
      call: {Polarex.Generated.Featured, :customers_get_state_external},
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
      call: {Polarex.Generated.Featured, :customers_list},
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
      call: {Polarex.Generated.Featured, :customers_update},
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
      call: {Polarex.Generated.Featured, :customers_update_external},
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

  @doc """
  Create Discount

  Create a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_create(
          Polarex.Generated.DiscountFixedOnceForeverDurationCreate.t()
          | Polarex.Generated.DiscountFixedRepeatDurationCreate.t()
          | Polarex.Generated.DiscountPercentageOnceForeverDurationCreate.t()
          | Polarex.Generated.DiscountPercentageRepeatDurationCreate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.DiscountFixedOnceForeverDuration.t()
           | Polarex.Generated.DiscountFixedRepeatDuration.t()
           | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
           | Polarex.Generated.DiscountPercentageRepeatDuration.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def discounts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :discounts_create},
      url: "/v1/discounts/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDurationCreate, :t},
            {Polarex.Generated.DiscountFixedRepeatDurationCreate, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDurationCreate, :t},
            {Polarex.Generated.DiscountPercentageRepeatDurationCreate, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
            {Polarex.Generated.DiscountFixedRepeatDuration, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
          ]}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Discount

  Delete a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def discounts_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :discounts_delete},
      url: "/v1/discounts/#{id}",
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
  Get Discount

  Get a discount by ID.

  **Scopes**: `discounts:read` `discounts:write`
  """
  @spec discounts_get(String.t(), keyword) ::
          {:ok,
           Polarex.Generated.DiscountFixedOnceForeverDuration.t()
           | Polarex.Generated.DiscountFixedRepeatDuration.t()
           | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
           | Polarex.Generated.DiscountPercentageRepeatDuration.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def discounts_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :discounts_get},
      url: "/v1/discounts/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
            {Polarex.Generated.DiscountFixedRepeatDuration, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Discounts

  List discounts.

  **Scopes**: `discounts:read` `discounts:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `query`: Filter by name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec discounts_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceDiscount.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def discounts_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :discounts_list},
      url: "/v1/discounts/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceDiscount, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Discount

  Update a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_update(String.t(), Polarex.Generated.DiscountUpdate.t(), keyword) ::
          {:ok,
           Polarex.Generated.DiscountFixedOnceForeverDuration.t()
           | Polarex.Generated.DiscountFixedRepeatDuration.t()
           | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
           | Polarex.Generated.DiscountPercentageRepeatDuration.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def discounts_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :discounts_update},
      url: "/v1/discounts/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.DiscountUpdate, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
            {Polarex.Generated.DiscountFixedRepeatDuration, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Event

  Get an event by ID.

  **Scopes**: `events:read` `events:write`
  """
  @spec events_get(String.t(), keyword) ::
          {:ok, map | Polarex.Generated.UserEvent.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def events_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :events_get},
      url: "/v1/events/#{id}",
      method: :get,
      response: [
        {200, {:union, [:map, {Polarex.Generated.UserEvent, :t}]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Ingest Events

  Ingest batch of events.

  **Scopes**: `events:write`
  """
  @spec events_ingest(Polarex.Generated.EventsIngest.t(), keyword) ::
          {:ok, Polarex.Generated.EventsIngestResponse.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def events_ingest(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :events_ingest},
      url: "/v1/events/ingest",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.EventsIngest, :t}}],
      response: [
        {200, {Polarex.Generated.EventsIngestResponse, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Events

  List events.

  **Scopes**: `events:read` `events:write`

  ## Options

    * `filter`: Filter events following filter clauses. JSON string following the same schema a meter filter clause. 
    * `start_timestamp`: Filter events after this timestamp.
    * `end_timestamp`: Filter events before this timestamp.
    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `meter_id`: Filter by a meter filter clause.
    * `name`: Filter by event name.
    * `source`: Filter by event source.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec events_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceEvent.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def events_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :end_timestamp,
        :external_customer_id,
        :filter,
        :limit,
        :metadata,
        :meter_id,
        :name,
        :organization_id,
        :page,
        :sorting,
        :source,
        :start_timestamp
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :events_list},
      url: "/v1/events/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceEvent, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Event Names

  List event names.

  **Scopes**: `events:read` `events:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `source`: Filter by event source.
    * `query`: Query to filter event names.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec events_list_names(keyword) ::
          {:ok, Polarex.Generated.ListResourceEventName.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def events_list_names(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :limit,
        :organization_id,
        :page,
        :query,
        :sorting,
        :source
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :events_list_names},
      url: "/v1/events/names",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceEventName, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get License Key

  Get a license key.

  **Scopes**: `license_keys:read` `license_keys:write`
  """
  @spec license_keys_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyWithActivations.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :license_keys_get},
      url: "/v1/license-keys/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.LicenseKeyWithActivations, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Activation

  Get a license key activation.

  **Scopes**: `license_keys:read` `license_keys:write`
  """
  @spec license_keys_get_activation(String.t(), String.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_get_activation(id, activation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, activation_id: activation_id],
      call: {Polarex.Generated.Featured, :license_keys_get_activation},
      url: "/v1/license-keys/#{id}/activations/#{activation_id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.LicenseKeyActivationRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List License Keys

  Get license keys connected to the given organization & filters.

  **Scopes**: `license_keys:read` `license_keys:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `benefit_id`: Filter by benefit ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec license_keys_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceLicenseKeyRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :license_keys_list},
      url: "/v1/license-keys/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceLicenseKeyRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update License Key

  Update a license key.

  **Scopes**: `license_keys:write`
  """
  @spec license_keys_update(String.t(), Polarex.Generated.LicenseKeyUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :license_keys_update},
      url: "/v1/license-keys/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.LicenseKeyUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.LicenseKeyRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Meter

  Create a meter.

  **Scopes**: `meters:write`
  """
  @spec meters_create(Polarex.Generated.MeterCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Meter.t()} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def meters_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :meters_create},
      url: "/v1/meters/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.MeterCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Meter, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Meter

  Get a meter by ID.

  **Scopes**: `meters:read` `meters:write`
  """
  @spec meters_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Meter.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :meters_get},
      url: "/v1/meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Meter, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec meters_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceMeter.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def meters_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :metadata, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :meters_list},
      url: "/v1/meters/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceMeter, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
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
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.

  """
  @spec meters_quantities(String.t(), keyword) ::
          {:ok, Polarex.Generated.MeterQuantities.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def meters_quantities(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :end_timestamp,
        :external_customer_id,
        :interval,
        :start_timestamp
      ])

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :meters_quantities},
      url: "/v1/meters/#{id}/quantities",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.MeterQuantities, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Meter

  Update a meter.

  **Scopes**: `meters:write`
  """
  @spec meters_update(String.t(), Polarex.Generated.MeterUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Meter.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def meters_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :meters_update},
      url: "/v1/meters/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.MeterUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Meter, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Introspect Token

  Get information about an access token.
  """
  @spec oauth2_introspect_token(Polarex.Generated.IntrospectTokenRequest.t(), keyword) ::
          {:ok, Polarex.Generated.IntrospectTokenResponse.t()} | :error
  def oauth2_introspect_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :oauth2_introspect_token},
      url: "/v1/oauth2/introspect",
      body: body,
      method: :post,
      request: [
        {"application/x-www-form-urlencoded", {Polarex.Generated.IntrospectTokenRequest, :t}}
      ],
      response: [{200, {Polarex.Generated.IntrospectTokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Request Token

  Request an access token using a valid grant.
  """
  @spec oauth2_request_token(
          Polarex.Generated.AuthorizationCodeTokenRequest.t()
          | Polarex.Generated.RefreshTokenRequest.t(),
          keyword
        ) :: {:ok, Polarex.Generated.TokenResponse.t()} | :error
  def oauth2_request_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :oauth2_request_token},
      url: "/v1/oauth2/token",
      body: body,
      method: :post,
      request: [
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {Polarex.Generated.AuthorizationCodeTokenRequest, :t},
            {Polarex.Generated.RefreshTokenRequest, :t}
          ]}}
      ],
      response: [{200, {Polarex.Generated.TokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Revoke Token

  Revoke an access token or a refresh token.
  """
  @spec oauth2_revoke_token(Polarex.Generated.RevokeTokenRequest.t(), keyword) ::
          {:ok, map} | :error
  def oauth2_revoke_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :oauth2_revoke_token},
      url: "/v1/oauth2/revoke",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", {Polarex.Generated.RevokeTokenRequest, :t}}],
      response: [{200, :map}],
      opts: opts
    })
  end

  @doc """
  Get User Info

  Get information about the authenticated user.
  """
  @spec oauth2_userinfo(keyword) ::
          {:ok, Polarex.Generated.UserInfoOrganization.t() | Polarex.Generated.UserInfoUser.t()}
          | :error
  def oauth2_userinfo(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :oauth2_userinfo},
      url: "/v1/oauth2/userinfo",
      method: :get,
      response: [
        {200,
         {:union,
          [{Polarex.Generated.UserInfoOrganization, :t}, {Polarex.Generated.UserInfoUser, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Organization

  Create an organization.

  **Scopes**: `organizations:write`
  """
  @spec organizations_create(Polarex.Generated.OrganizationCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Organization.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def organizations_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :organizations_create},
      url: "/v1/organizations/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.OrganizationCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Organization, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Organization

  Get an organization by ID.

  **Scopes**: `organizations:read` `organizations:write`
  """
  @spec organizations_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Organization.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def organizations_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :organizations_get},
      url: "/v1/organizations/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Organization, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Organizations

  List organizations.

  **Scopes**: `organizations:read` `organizations:write`

  ## Options

    * `slug`: Filter by slug.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec organizations_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceOrganization.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def organizations_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :slug, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Featured, :organizations_list},
      url: "/v1/organizations/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceOrganization, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Organization

  Update an organization.

  **Scopes**: `organizations:write`
  """
  @spec organizations_update(String.t(), Polarex.Generated.OrganizationUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Organization.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def organizations_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :organizations_update},
      url: "/v1/organizations/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.OrganizationUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Organization, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Product

  Create a product.

  **Scopes**: `products:write`
  """
  @spec products_create(Polarex.Generated.ProductCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def products_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Featured, :products_create},
      url: "/v1/products/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.ProductCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Product, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Product

  Get a product by ID.

  **Scopes**: `products:read` `products:write`
  """
  @spec products_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def products_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Featured, :products_get},
      url: "/v1/products/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Product, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.ListResourceProduct.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
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
      call: {Polarex.Generated.Featured, :products_list},
      url: "/v1/products/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceProduct, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product

  Update a product.

  **Scopes**: `products:write`
  """
  @spec products_update(String.t(), Polarex.Generated.ProductUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def products_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :products_update},
      url: "/v1/products/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.ProductUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Product, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product Benefits

  Update benefits granted by a product.

  **Scopes**: `products:write`
  """
  @spec products_update_benefits(String.t(), Polarex.Generated.ProductBenefitsUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def products_update_benefits(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Featured, :products_update_benefits},
      url: "/v1/products/#{id}/benefits",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.ProductBenefitsUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Product, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

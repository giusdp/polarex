defmodule Polarex.CustomerPortal do
  @moduledoc """
  Provides API endpoints related to customer portal
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Benefit Grant

  Get a benefit grant by ID for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_benefit_grants_get(String.t(), keyword) ::
          {:ok,
           Polarex.CustomerBenefitGrantCustom.t()
           | Polarex.CustomerBenefitGrantDiscord.t()
           | Polarex.CustomerBenefitGrantDownloadables.t()
           | Polarex.CustomerBenefitGrantGitHubRepository.t()
           | Polarex.CustomerBenefitGrantLicenseKeys.t()
           | Polarex.CustomerBenefitGrantMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_benefit_grants_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_benefit_grants_get},
      url: "/v1/customer-portal/benefit-grants/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomerBenefitGrantCustom, :t},
            {Polarex.CustomerBenefitGrantDiscord, :t},
            {Polarex.CustomerBenefitGrantDownloadables, :t},
            {Polarex.CustomerBenefitGrantGitHubRepository, :t},
            {Polarex.CustomerBenefitGrantLicenseKeys, :t},
            {Polarex.CustomerBenefitGrantMeterCredit, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Benefit Grants

  List benefits grants of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `type`: Filter by benefit type.
    * `benefit_id`: Filter by benefit ID.
    * `checkout_id`: Filter by checkout ID.
    * `order_id`: Filter by order ID.
    * `subscription_id`: Filter by subscription ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_benefit_grants_list(keyword) ::
          {:ok, Polarex.ListResourceCustomerBenefitGrant.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_benefit_grants_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :benefit_id,
        :checkout_id,
        :limit,
        :order_id,
        :page,
        :sorting,
        :subscription_id,
        :type
      ])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_benefit_grants_list},
      url: "/v1/customer-portal/benefit-grants/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerBenefitGrant, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Benefit Grant

  Update a benefit grant for the authenticated customer.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_benefit_grants_update(
          String.t(),
          Polarex.CustomerBenefitGrantCustomUpdate.t()
          | Polarex.CustomerBenefitGrantDiscordUpdate.t()
          | Polarex.CustomerBenefitGrantDownloadablesUpdate.t()
          | Polarex.CustomerBenefitGrantGitHubRepositoryUpdate.t()
          | Polarex.CustomerBenefitGrantLicenseKeysUpdate.t()
          | Polarex.CustomerBenefitGrantMeterCreditUpdate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.CustomerBenefitGrantCustom.t()
           | Polarex.CustomerBenefitGrantDiscord.t()
           | Polarex.CustomerBenefitGrantDownloadables.t()
           | Polarex.CustomerBenefitGrantGitHubRepository.t()
           | Polarex.CustomerBenefitGrantLicenseKeys.t()
           | Polarex.CustomerBenefitGrantMeterCredit.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_benefit_grants_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.CustomerPortal, :customer_portal_benefit_grants_update},
      url: "/v1/customer-portal/benefit-grants/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomerBenefitGrantCustomUpdate, :t},
            {Polarex.CustomerBenefitGrantDiscordUpdate, :t},
            {Polarex.CustomerBenefitGrantDownloadablesUpdate, :t},
            {Polarex.CustomerBenefitGrantGitHubRepositoryUpdate, :t},
            {Polarex.CustomerBenefitGrantLicenseKeysUpdate, :t},
            {Polarex.CustomerBenefitGrantMeterCreditUpdate, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomerBenefitGrantCustom, :t},
            {Polarex.CustomerBenefitGrantDiscord, :t},
            {Polarex.CustomerBenefitGrantDownloadables, :t},
            {Polarex.CustomerBenefitGrantGitHubRepository, :t},
            {Polarex.CustomerBenefitGrantLicenseKeys, :t},
            {Polarex.CustomerBenefitGrantMeterCredit, :t}
          ]}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.CustomerCustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_customer_meters_get},
      url: "/v1/customer-portal/meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerCustomerMeter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.ListResourceCustomerCustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customer_meters_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :meter_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_customer_meters_list},
      url: "/v1/customer-portal/meters/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerCustomerMeter, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Introspect Customer Session

  Introspect the current session and return its information.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_session_introspect(keyword) ::
          {:ok, Polarex.CustomerCustomerSession.t()} | :error
  def customer_portal_customer_session_introspect(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_customer_session_introspect},
      url: "/v1/customer-portal/customer-session/introspect",
      method: :get,
      response: [{200, {Polarex.CustomerCustomerSession, :t}}],
      opts: opts
    })
  end

  @doc """
  Add Customer Payment Method

  Add a payment method to the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_add_payment_method(
          Polarex.CustomerPaymentMethodCreate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.CustomerPaymentMethodCreateRequiresActionResponse.t()
           | Polarex.CustomerPaymentMethodCreateSucceededResponse.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_add_payment_method(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_customers_add_payment_method},
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
  Confirm Customer Payment Method

  Confirm a payment method for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_confirm_payment_method(
          Polarex.CustomerPaymentMethodConfirm.t(),
          keyword
        ) ::
          {:ok,
           Polarex.CustomerPaymentMethodCreateRequiresActionResponse.t()
           | Polarex.CustomerPaymentMethodCreateSucceededResponse.t()}
          | {:error, Polarex.CustomerNotReady.t() | Polarex.HTTPValidationError.t()}
  def customer_portal_customers_confirm_payment_method(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_customers_confirm_payment_method},
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

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customers_delete_payment_method(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.PaymentMethodInUseByActiveSubscription.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_customers_delete_payment_method(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_customers_delete_payment_method},
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
  @spec customer_portal_customers_get(keyword) ::
          {:ok, Polarex.CustomerPortalCustomer.t()} | :error
  def customer_portal_customers_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_customers_get},
      url: "/v1/customer-portal/customers/me",
      method: :get,
      response: [{200, {Polarex.CustomerPortalCustomer, :t}}],
      opts: opts
    })
  end

  @doc """
  List Customer Payment Methods

  Get saved payment methods of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_customers_list_payment_methods(keyword) ::
          {:ok, Polarex.ListResourceCustomerPaymentMethod.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_list_payment_methods(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_customers_list_payment_methods},
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
  Update Customer

  Update authenticated customer.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_customers_update(Polarex.CustomerPortalCustomerUpdate.t(), keyword) ::
          {:ok, Polarex.CustomerPortalCustomer.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customers_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_customers_update},
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
  List Downloadables

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `benefit_id`: Filter by benefit ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_downloadables_list(keyword) ::
          {:ok, Polarex.ListResourceDownloadableRead.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_downloadables_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_downloadables_list},
      url: "/v1/customer-portal/downloadables/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceDownloadableRead, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Activate License Key

  Activate a license key instance.

  > This endpoint doesn't require authentication and can be safely used on a public
  > client, like a desktop application or a mobile app.
  > If you plan to validate a license key on a server, use the `/v1/license-keys/activate`
  > endpoint instead.
  """
  @spec customer_portal_license_keys_activate(Polarex.LicenseKeyActivate.t(), keyword) ::
          {:ok, Polarex.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_activate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_license_keys_activate},
      url: "/v1/customer-portal/license-keys/activate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.LicenseKeyActivate, :t}}],
      response: [
        {200, {Polarex.LicenseKeyActivationRead, :t}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Deactivate License Key

  Deactivate a license key instance.

  > This endpoint doesn't require authentication and can be safely used on a public
  > client, like a desktop application or a mobile app.
  > If you plan to validate a license key on a server, use the `/v1/license-keys/deactivate`
  > endpoint instead.
  """
  @spec customer_portal_license_keys_deactivate(Polarex.LicenseKeyDeactivate.t(), keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_deactivate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_license_keys_deactivate},
      url: "/v1/customer-portal/license-keys/deactivate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.LicenseKeyDeactivate, :t}}],
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.LicenseKeyWithActivations.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_license_keys_get},
      url: "/v1/customer-portal/license-keys/#{id}",
      method: :get,
      response: [
        {200, {Polarex.LicenseKeyWithActivations, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List License Keys

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `benefit_id`: Filter by a specific benefit
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_license_keys_list(keyword) ::
          {:ok, Polarex.ListResourceLicenseKeyRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.Unauthorized.t()}
  def customer_portal_license_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_license_keys_list},
      url: "/v1/customer-portal/license-keys/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceLicenseKeyRead, :t}},
        {401, {Polarex.Unauthorized, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Validate License Key

  Validate a license key.

  > This endpoint doesn't require authentication and can be safely used on a public
  > client, like a desktop application or a mobile app.
  > If you plan to validate a license key on a server, use the `/v1/license-keys/validate`
  > endpoint instead.
  """
  @spec customer_portal_license_keys_validate(Polarex.LicenseKeyValidate.t(), keyword) ::
          {:ok, Polarex.ValidatedLicenseKey.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_validate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_license_keys_validate},
      url: "/v1/customer-portal/license-keys/validate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.LicenseKeyValidate, :t}}],
      response: [
        {200, {Polarex.ValidatedLicenseKey, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Confirm Retry Payment

  Confirm a retry payment using a Stripe confirmation token.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_orders_confirm_retry_payment(
          String.t(),
          Polarex.CustomerOrderConfirmPayment.t(),
          keyword
        ) ::
          {:ok, Polarex.CustomerOrderPaymentConfirmation.t()}
          | {:error,
             Polarex.OrderNotEligibleForRetry.t()
             | Polarex.PaymentAlreadyInProgress.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_confirm_retry_payment(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.CustomerPortal, :customer_portal_orders_confirm_retry_payment},
      url: "/v1/customer-portal/orders/#{id}/confirm-payment",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerOrderConfirmPayment, :t}}],
      response: [
        {200, {Polarex.CustomerOrderPaymentConfirmation, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.PaymentAlreadyInProgress, :t}},
        {422, {Polarex.OrderNotEligibleForRetry, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate Order Invoice

  Trigger generation of an order's invoice.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_orders_generate_invoice(String.t(), keyword) ::
          {:ok, map}
          | {:error, Polarex.MissingInvoiceBillingDetails.t() | Polarex.NotPaidOrder.t()}
  def customer_portal_orders_generate_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_orders_generate_invoice},
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

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_orders_get(String.t(), keyword) ::
          {:ok, Polarex.CustomerOrder.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_orders_get},
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

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_orders_get_payment_status(String.t(), keyword) ::
          {:ok, Polarex.CustomerOrderPaymentStatus.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_get_payment_status(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_orders_get_payment_status},
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

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_orders_invoice(String.t(), keyword) ::
          {:ok, Polarex.CustomerOrderInvoice.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_orders_invoice},
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

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `product_id`: Filter by product ID.
    * `product_billing_type`: Filter by product billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `subscription_id`: Filter by subscription ID.
    * `query`: Search by product or organization name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_orders_list(keyword) ::
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
      call: {Polarex.CustomerPortal, :customer_portal_orders_list},
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
  Update Order

  Update an order for the authenticated customer.

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_orders_update(String.t(), Polarex.CustomerOrderUpdate.t(), keyword) ::
          {:ok, Polarex.CustomerOrder.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_orders_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.CustomerPortal, :customer_portal_orders_update},
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
  Get Organization

  Get a customer portal's organization by slug.
  """
  @spec customer_portal_organizations_get(String.t(), keyword) ::
          {:ok, Polarex.CustomerOrganizationData.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_organizations_get(slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [slug: slug],
      call: {Polarex.CustomerPortal, :customer_portal_organizations_get},
      url: "/v1/customer-portal/organizations/#{slug}",
      method: :get,
      response: [
        {200, {Polarex.CustomerOrganizationData, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Assign Seat

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_seats_assign_seat(Polarex.SeatAssign.t(), keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_assign_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerPortal, :customer_portal_seats_assign_seat},
      url: "/v1/customer-portal/seats",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.SeatAssign, :t}}],
      response: [
        {200, {Polarex.CustomerSeat, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Claimed Subscriptions

  List all subscriptions where the authenticated customer has claimed a seat.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_seats_list_claimed_subscriptions(keyword) ::
          {:ok, [Polarex.CustomerSubscription.t()]} | :error
  def customer_portal_seats_list_claimed_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_seats_list_claimed_subscriptions},
      url: "/v1/customer-portal/seats/subscriptions",
      method: :get,
      response: [{200, [{Polarex.CustomerSubscription, :t}]}, {401, :null}],
      opts: opts
    })
  end

  @doc """
  List Seats

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `subscription_id`: Subscription ID
    * `order_id`: Order ID

  """
  @spec customer_portal_seats_list_seats(keyword) ::
          {:ok, Polarex.SeatsList.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_list_seats(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order_id, :subscription_id])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_seats_list_seats},
      url: "/v1/customer-portal/seats",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.SeatsList, :t}},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Resend Invitation

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_seats_resend_invitation(String.t(), keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_resend_invitation(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.CustomerPortal, :customer_portal_seats_resend_invitation},
      url: "/v1/customer-portal/seats/#{seat_id}/resend",
      method: :post,
      response: [
        {200, {Polarex.CustomerSeat, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Revoke Seat

  **Scopes**: `customer_portal:write`
  """
  @spec customer_portal_seats_revoke_seat(String.t(), keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_revoke_seat(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.CustomerPortal, :customer_portal_seats_revoke_seat},
      url: "/v1/customer-portal/seats/#{seat_id}",
      method: :delete,
      response: [
        {200, {Polarex.CustomerSeat, :t}},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_cancel(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_subscriptions_cancel},
      url: "/v1/customer-portal/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_subscriptions_get},
      url: "/v1/customer-portal/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Subscriptions

  List subscriptions of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `product_id`: Filter by product ID.
    * `active`: Filter by active or cancelled subscription.
    * `query`: Search by product or organization name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_subscriptions_list(keyword) ::
          {:ok, Polarex.ListResourceCustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:active, :limit, :page, :product_id, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_subscriptions_list},
      url: "/v1/customer-portal/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerSubscription, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
          Polarex.CustomerSubscriptionCancel.t()
          | Polarex.CustomerSubscriptionUpdateProduct.t()
          | Polarex.CustomerSubscriptionUpdateSeats.t(),
          keyword
        ) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.CustomerPortal, :customer_portal_subscriptions_update},
      url: "/v1/customer-portal/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomerSubscriptionCancel, :t},
            {Polarex.CustomerSubscriptionUpdateProduct, :t},
            {Polarex.CustomerSubscriptionUpdateSeats, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Wallet

  Get a wallet by ID for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_wallets_get(String.t(), keyword) ::
          {:ok, Polarex.CustomerWallet.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_wallets_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomerPortal, :customer_portal_wallets_get},
      url: "/v1/customer-portal/wallets/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerWallet, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Wallets

  List wallets of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_wallets_list(keyword) ::
          {:ok, Polarex.ListResourceCustomerWallet.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_wallets_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.CustomerPortal, :customer_portal_wallets_list},
      url: "/v1/customer-portal/wallets/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerWallet, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

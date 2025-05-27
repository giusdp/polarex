defmodule Polarex.Generated.CustomerPortal do
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
           Polarex.Generated.CustomerBenefitGrantCustom.t()
           | Polarex.Generated.CustomerBenefitGrantDiscord.t()
           | Polarex.Generated.CustomerBenefitGrantDownloadables.t()
           | Polarex.Generated.CustomerBenefitGrantGitHubRepository.t()
           | Polarex.Generated.CustomerBenefitGrantLicenseKeys.t()
           | Polarex.Generated.CustomerBenefitGrantMeterCredit.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_benefit_grants_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CustomerPortal, :customer_portal_benefit_grants_get},
      url: "/v1/customer-portal/benefit-grants/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.CustomerBenefitGrantCustom, :t},
            {Polarex.Generated.CustomerBenefitGrantDiscord, :t},
            {Polarex.Generated.CustomerBenefitGrantDownloadables, :t},
            {Polarex.Generated.CustomerBenefitGrantGitHubRepository, :t},
            {Polarex.Generated.CustomerBenefitGrantLicenseKeys, :t},
            {Polarex.Generated.CustomerBenefitGrantMeterCredit, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
    * `organization_id`: Filter by organization ID.
    * `checkout_id`: Filter by checkout ID.
    * `order_id`: Filter by order ID.
    * `subscription_id`: Filter by subscription ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_benefit_grants_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCustomerBenefitGrant.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_benefit_grants_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :benefit_id,
        :checkout_id,
        :limit,
        :order_id,
        :organization_id,
        :page,
        :sorting,
        :subscription_id,
        :type
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.CustomerPortal, :customer_portal_benefit_grants_list},
      url: "/v1/customer-portal/benefit-grants/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomerBenefitGrant, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          Polarex.Generated.CustomerBenefitGrantCustomUpdate.t()
          | Polarex.Generated.CustomerBenefitGrantDiscordUpdate.t()
          | Polarex.Generated.CustomerBenefitGrantDownloadablesUpdate.t()
          | Polarex.Generated.CustomerBenefitGrantGitHubRepositoryUpdate.t()
          | Polarex.Generated.CustomerBenefitGrantLicenseKeysUpdate.t()
          | Polarex.Generated.CustomerBenefitGrantMeterCreditUpdate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.CustomerBenefitGrantCustom.t()
           | Polarex.Generated.CustomerBenefitGrantDiscord.t()
           | Polarex.Generated.CustomerBenefitGrantDownloadables.t()
           | Polarex.Generated.CustomerBenefitGrantGitHubRepository.t()
           | Polarex.Generated.CustomerBenefitGrantLicenseKeys.t()
           | Polarex.Generated.CustomerBenefitGrantMeterCredit.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_benefit_grants_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.CustomerPortal, :customer_portal_benefit_grants_update},
      url: "/v1/customer-portal/benefit-grants/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomerBenefitGrantCustomUpdate, :t},
            {Polarex.Generated.CustomerBenefitGrantDiscordUpdate, :t},
            {Polarex.Generated.CustomerBenefitGrantDownloadablesUpdate, :t},
            {Polarex.Generated.CustomerBenefitGrantGitHubRepositoryUpdate, :t},
            {Polarex.Generated.CustomerBenefitGrantLicenseKeysUpdate, :t},
            {Polarex.Generated.CustomerBenefitGrantMeterCreditUpdate, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.CustomerBenefitGrantCustom, :t},
            {Polarex.Generated.CustomerBenefitGrantDiscord, :t},
            {Polarex.Generated.CustomerBenefitGrantDownloadables, :t},
            {Polarex.Generated.CustomerBenefitGrantGitHubRepository, :t},
            {Polarex.Generated.CustomerBenefitGrantLicenseKeys, :t},
            {Polarex.Generated.CustomerBenefitGrantMeterCredit, :t}
          ]}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customer_meters_get},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customer_meters_list},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customers_add_payment_method},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customers_delete_payment_method},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customers_get},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customers_get_payment_methods},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_customers_update},
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
  Get Downloadable
  """
  @spec customer_portal_downloadables_customer_portal_downloadables_get(String.t(), keyword) ::
          {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_downloadables_customer_portal_downloadables_get(token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [token: token],
      call:
        {Polarex.Generated.CustomerPortal,
         :customer_portal_downloadables_customer_portal_downloadables_get},
      url: "/v1/customer-portal/downloadables/#{token}",
      method: :get,
      response: [
        {200, :map},
        {302, :null},
        {400, :null},
        {404, :null},
        {410, :null},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Downloadables

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `benefit_id`: Filter by benefit ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_downloadables_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceDownloadableRead.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_portal_downloadables_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.CustomerPortal, :customer_portal_downloadables_list},
      url: "/v1/customer-portal/downloadables/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceDownloadableRead, :t}},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_license_keys_activate},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_license_keys_deactivate},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_license_keys_get},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_license_keys_list},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_license_keys_validate},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_orders_get},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_orders_invoice},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_orders_list},
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
  Get Organization

  Get a customer portal's organization by slug.
  """
  @spec customer_portal_organizations_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CustomerOrganization.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_organizations_get(slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [slug: slug],
      call: {Polarex.Generated.CustomerPortal, :customer_portal_organizations_get},
      url: "/v1/customer-portal/organizations/#{slug}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CustomerOrganization, :t}},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_subscriptions_cancel},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_subscriptions_get},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_subscriptions_list},
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
      call: {Polarex.Generated.CustomerPortal, :customer_portal_subscriptions_update},
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
end

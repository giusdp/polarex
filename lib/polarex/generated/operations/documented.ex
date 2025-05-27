defmodule Polarex.Generated.Documented do
  @moduledoc """
  Provides API endpoints related to documented
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Benefit

  Create a benefit.

  **Scopes**: `benefits:write`
  """
  @spec benefits_create(
          Polarex.Generated.BenefitCustomCreate.t()
          | Polarex.Generated.BenefitDiscordCreate.t()
          | Polarex.Generated.BenefitDownloadablesCreate.t()
          | Polarex.Generated.BenefitGitHubRepositoryCreate.t()
          | Polarex.Generated.BenefitLicenseKeysCreate.t()
          | Polarex.Generated.BenefitMeterCreditCreate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.BenefitCustom.t()
           | Polarex.Generated.BenefitDiscord.t()
           | Polarex.Generated.BenefitDownloadables.t()
           | Polarex.Generated.BenefitGitHubRepository.t()
           | Polarex.Generated.BenefitLicenseKeys.t()
           | Polarex.Generated.BenefitMeterCredit.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def benefits_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Documented, :benefits_create},
      url: "/v1/benefits/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.BenefitCustomCreate, :t},
            {Polarex.Generated.BenefitDiscordCreate, :t},
            {Polarex.Generated.BenefitDownloadablesCreate, :t},
            {Polarex.Generated.BenefitGitHubRepositoryCreate, :t},
            {Polarex.Generated.BenefitLicenseKeysCreate, :t},
            {Polarex.Generated.BenefitMeterCreditCreate, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.Generated.BenefitCustom, :t},
            {Polarex.Generated.BenefitDiscord, :t},
            {Polarex.Generated.BenefitDownloadables, :t},
            {Polarex.Generated.BenefitGitHubRepository, :t},
            {Polarex.Generated.BenefitLicenseKeys, :t},
            {Polarex.Generated.BenefitMeterCredit, :t}
          ]}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Benefit

  Delete a benefit.

  > [!WARNING]
  > Every grants associated with the benefit will be revoked.
  > Users will lose access to the benefit.

  **Scopes**: `benefits:write`
  """
  @spec benefits_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def benefits_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :benefits_delete},
      url: "/v1/benefits/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Benefit

  Get a benefit by ID.

  **Scopes**: `benefits:read` `benefits:write`
  """
  @spec benefits_get(String.t(), keyword) ::
          {:ok,
           Polarex.Generated.BenefitCustom.t()
           | Polarex.Generated.BenefitDiscord.t()
           | Polarex.Generated.BenefitDownloadables.t()
           | Polarex.Generated.BenefitGitHubRepository.t()
           | Polarex.Generated.BenefitLicenseKeys.t()
           | Polarex.Generated.BenefitMeterCredit.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def benefits_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :benefits_get},
      url: "/v1/benefits/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.BenefitCustom, :t},
            {Polarex.Generated.BenefitDiscord, :t},
            {Polarex.Generated.BenefitDownloadables, :t},
            {Polarex.Generated.BenefitGitHubRepository, :t},
            {Polarex.Generated.BenefitLicenseKeys, :t},
            {Polarex.Generated.BenefitMeterCredit, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Benefit Grants

  List the individual grants for a benefit.

  It's especially useful to check if a user has been granted a benefit.

  **Scopes**: `benefits:read` `benefits:write`

  ## Options

    * `is_granted`: Filter by granted status. If `true`, only granted benefits will be returned. If `false`, only revoked benefits will be returned. 
    * `customer_id`: Filter by customer.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec benefits_grants(String.t(), keyword) ::
          {:ok, Polarex.Generated.ListResourceBenefitGrant.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def benefits_grants(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :is_granted, :limit, :page])

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :benefits_grants},
      url: "/v1/benefits/#{id}/grants",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceBenefitGrant, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Benefits

  List benefits.

  **Scopes**: `benefits:read` `benefits:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `type`: Filter by benefit type.
    * `query`: Filter by description.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec benefits_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceBenefit.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def benefits_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting, :type])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :benefits_list},
      url: "/v1/benefits/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceBenefit, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Benefit

  Update a benefit.

  **Scopes**: `benefits:write`
  """
  @spec benefits_update(
          String.t(),
          Polarex.Generated.BenefitCustomUpdate.t()
          | Polarex.Generated.BenefitDiscordUpdate.t()
          | Polarex.Generated.BenefitDownloadablesUpdate.t()
          | Polarex.Generated.BenefitGitHubRepositoryUpdate.t()
          | Polarex.Generated.BenefitLicenseKeysUpdate.t()
          | Polarex.Generated.BenefitMeterCreditUpdate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.BenefitCustom.t()
           | Polarex.Generated.BenefitDiscord.t()
           | Polarex.Generated.BenefitDownloadables.t()
           | Polarex.Generated.BenefitGitHubRepository.t()
           | Polarex.Generated.BenefitLicenseKeys.t()
           | Polarex.Generated.BenefitMeterCredit.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def benefits_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Documented, :benefits_update},
      url: "/v1/benefits/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.BenefitCustomUpdate, :t},
            {Polarex.Generated.BenefitDiscordUpdate, :t},
            {Polarex.Generated.BenefitDownloadablesUpdate, :t},
            {Polarex.Generated.BenefitGitHubRepositoryUpdate, :t},
            {Polarex.Generated.BenefitLicenseKeysUpdate, :t},
            {Polarex.Generated.BenefitMeterCreditUpdate, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.BenefitCustom, :t},
            {Polarex.Generated.BenefitDiscord, :t},
            {Polarex.Generated.BenefitDownloadables, :t},
            {Polarex.Generated.BenefitGitHubRepository, :t},
            {Polarex.Generated.BenefitLicenseKeys, :t},
            {Polarex.Generated.BenefitMeterCredit, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Checkout Link

  Create a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_create(
          Polarex.Generated.CheckoutLinkCreateProduct.t()
          | Polarex.Generated.CheckoutLinkCreateProductPrice.t()
          | Polarex.Generated.CheckoutLinkCreateProducts.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.CheckoutLink.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkout_links_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Documented, :checkout_links_create},
      url: "/v1/checkout-links/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CheckoutLinkCreateProduct, :t},
            {Polarex.Generated.CheckoutLinkCreateProductPrice, :t},
            {Polarex.Generated.CheckoutLinkCreateProducts, :t}
          ]}}
      ],
      response: [
        {201, {Polarex.Generated.CheckoutLink, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Checkout Link

  Delete a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkout_links_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :checkout_links_delete},
      url: "/v1/checkout-links/#{id}",
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
  Get Checkout Link

  Get a checkout link by ID.

  **Scopes**: `checkout_links:read` `checkout_links:write`
  """
  @spec checkout_links_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutLink.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkout_links_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :checkout_links_get},
      url: "/v1/checkout-links/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CheckoutLink, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Checkout Links

  List checkout links.

  **Scopes**: `checkout_links:read` `checkout_links:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec checkout_links_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCheckoutLink.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkout_links_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :product_id, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :checkout_links_list},
      url: "/v1/checkout-links/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCheckoutLink, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Link

  Update a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_update(String.t(), Polarex.Generated.CheckoutLinkUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutLink.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkout_links_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Documented, :checkout_links_update},
      url: "/v1/checkout-links/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CheckoutLinkUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.CheckoutLink, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

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
      call: {Polarex.Generated.Documented, :checkouts_client_confirm},
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
      call: {Polarex.Generated.Documented, :checkouts_client_get},
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
      call: {Polarex.Generated.Documented, :checkouts_client_update},
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
      call: {Polarex.Generated.Documented, :checkouts_create},
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
      call: {Polarex.Generated.Documented, :checkouts_get},
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
      call: {Polarex.Generated.Documented, :checkouts_list},
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
      call: {Polarex.Generated.Documented, :checkouts_update},
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
  Create Custom Field

  Create a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_create(
          Polarex.Generated.CustomFieldCreateCheckbox.t()
          | Polarex.Generated.CustomFieldCreateDate.t()
          | Polarex.Generated.CustomFieldCreateNumber.t()
          | Polarex.Generated.CustomFieldCreateSelect.t()
          | Polarex.Generated.CustomFieldCreateText.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.CustomFieldCheckbox.t()
           | Polarex.Generated.CustomFieldDate.t()
           | Polarex.Generated.CustomFieldNumber.t()
           | Polarex.Generated.CustomFieldSelect.t()
           | Polarex.Generated.CustomFieldText.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def custom_fields_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Documented, :custom_fields_create},
      url: "/v1/custom-fields/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomFieldCreateCheckbox, :t},
            {Polarex.Generated.CustomFieldCreateDate, :t},
            {Polarex.Generated.CustomFieldCreateNumber, :t},
            {Polarex.Generated.CustomFieldCreateSelect, :t},
            {Polarex.Generated.CustomFieldCreateText, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.Generated.CustomFieldCheckbox, :t},
            {Polarex.Generated.CustomFieldDate, :t},
            {Polarex.Generated.CustomFieldNumber, :t},
            {Polarex.Generated.CustomFieldSelect, :t},
            {Polarex.Generated.CustomFieldText, :t}
          ]}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Custom Field

  Delete a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def custom_fields_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :custom_fields_delete},
      url: "/v1/custom-fields/#{id}",
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
  Get Custom Field

  Get a custom field by ID.

  **Scopes**: `custom_fields:read` `custom_fields:write`
  """
  @spec custom_fields_get(String.t(), keyword) ::
          {:ok,
           Polarex.Generated.CustomFieldCheckbox.t()
           | Polarex.Generated.CustomFieldDate.t()
           | Polarex.Generated.CustomFieldNumber.t()
           | Polarex.Generated.CustomFieldSelect.t()
           | Polarex.Generated.CustomFieldText.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def custom_fields_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :custom_fields_get},
      url: "/v1/custom-fields/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.CustomFieldCheckbox, :t},
            {Polarex.Generated.CustomFieldDate, :t},
            {Polarex.Generated.CustomFieldNumber, :t},
            {Polarex.Generated.CustomFieldSelect, :t},
            {Polarex.Generated.CustomFieldText, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Custom Fields

  List custom fields.

  **Scopes**: `custom_fields:read` `custom_fields:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `query`: Filter by custom field name or slug.
    * `type`: Filter by custom field type.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec custom_fields_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCustomField.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def custom_fields_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting, :type])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :custom_fields_list},
      url: "/v1/custom-fields/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomField, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Custom Field

  Update a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_update(
          String.t(),
          Polarex.Generated.CustomFieldUpdateCheckbox.t()
          | Polarex.Generated.CustomFieldUpdateDate.t()
          | Polarex.Generated.CustomFieldUpdateNumber.t()
          | Polarex.Generated.CustomFieldUpdateSelect.t()
          | Polarex.Generated.CustomFieldUpdateText.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.CustomFieldCheckbox.t()
           | Polarex.Generated.CustomFieldDate.t()
           | Polarex.Generated.CustomFieldNumber.t()
           | Polarex.Generated.CustomFieldSelect.t()
           | Polarex.Generated.CustomFieldText.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def custom_fields_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Documented, :custom_fields_update},
      url: "/v1/custom-fields/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomFieldUpdateCheckbox, :t},
            {Polarex.Generated.CustomFieldUpdateDate, :t},
            {Polarex.Generated.CustomFieldUpdateNumber, :t},
            {Polarex.Generated.CustomFieldUpdateSelect, :t},
            {Polarex.Generated.CustomFieldUpdateText, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.CustomFieldCheckbox, :t},
            {Polarex.Generated.CustomFieldDate, :t},
            {Polarex.Generated.CustomFieldNumber, :t},
            {Polarex.Generated.CustomFieldSelect, :t},
            {Polarex.Generated.CustomFieldText, :t}
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
      call: {Polarex.Generated.Documented, :customer_meters_get},
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
      call: {Polarex.Generated.Documented, :customer_meters_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_benefit_grants_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_benefit_grants_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_benefit_grants_update},
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
      call: {Polarex.Generated.Documented, :customer_portal_customer_meters_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_customer_meters_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_customers_add_payment_method},
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
      call: {Polarex.Generated.Documented, :customer_portal_customers_delete_payment_method},
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
      call: {Polarex.Generated.Documented, :customer_portal_customers_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_customers_get_payment_methods},
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
      call: {Polarex.Generated.Documented, :customer_portal_customers_update},
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
        {Polarex.Generated.Documented,
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
      call: {Polarex.Generated.Documented, :customer_portal_downloadables_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_license_keys_activate},
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
      call: {Polarex.Generated.Documented, :customer_portal_license_keys_deactivate},
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
      call: {Polarex.Generated.Documented, :customer_portal_license_keys_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_license_keys_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_license_keys_validate},
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
      call: {Polarex.Generated.Documented, :customer_portal_orders_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_orders_invoice},
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
      call: {Polarex.Generated.Documented, :customer_portal_orders_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_organizations_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_subscriptions_cancel},
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
      call: {Polarex.Generated.Documented, :customer_portal_subscriptions_get},
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
      call: {Polarex.Generated.Documented, :customer_portal_subscriptions_list},
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
      call: {Polarex.Generated.Documented, :customer_portal_subscriptions_update},
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
      call: {Polarex.Generated.Documented, :customer_sessions_create},
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
      call: {Polarex.Generated.Documented, :customers_create},
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
      call: {Polarex.Generated.Documented, :customers_delete},
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
      call: {Polarex.Generated.Documented, :customers_delete_external},
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
      call: {Polarex.Generated.Documented, :customers_get},
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
      call: {Polarex.Generated.Documented, :customers_get_external},
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
      call: {Polarex.Generated.Documented, :customers_get_state},
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
      call: {Polarex.Generated.Documented, :customers_get_state_external},
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
      call: {Polarex.Generated.Documented, :customers_list},
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
      call: {Polarex.Generated.Documented, :customers_update},
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
      call: {Polarex.Generated.Documented, :customers_update_external},
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
      call: {Polarex.Generated.Documented, :discounts_create},
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
      call: {Polarex.Generated.Documented, :discounts_delete},
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
      call: {Polarex.Generated.Documented, :discounts_get},
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
      call: {Polarex.Generated.Documented, :discounts_list},
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
      call: {Polarex.Generated.Documented, :discounts_update},
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
      call: {Polarex.Generated.Documented, :events_get},
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
      call: {Polarex.Generated.Documented, :events_ingest},
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
      call: {Polarex.Generated.Documented, :events_list},
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
      call: {Polarex.Generated.Documented, :events_list_names},
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
  Create File

  Create a file.

  **Scopes**: `files:write`
  """
  @spec files_create(
          Polarex.Generated.DownloadableFileCreate.t()
          | Polarex.Generated.OrganizationAvatarFileCreate.t()
          | Polarex.Generated.ProductMediaFileCreate.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.FileUpload.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def files_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Documented, :files_create},
      url: "/v1/files/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.DownloadableFileCreate, :t},
            {Polarex.Generated.OrganizationAvatarFileCreate, :t},
            {Polarex.Generated.ProductMediaFileCreate, :t}
          ]}}
      ],
      response: [
        {201, {Polarex.Generated.FileUpload, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete File

  Delete a file.

  **Scopes**: `files:write`
  """
  @spec files_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def files_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :files_delete},
      url: "/v1/files/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Files

  List files.

  **Scopes**: `files:read` `files:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `ids`: Filter by file ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec files_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceFileRead.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def files_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :files_list},
      url: "/v1/files/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceFileRead, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update File

  Update a file.

  **Scopes**: `files:write`
  """
  @spec files_update(String.t(), Polarex.Generated.FilePatch.t(), keyword) ::
          {:ok,
           Polarex.Generated.DownloadableFileRead.t()
           | Polarex.Generated.OrganizationAvatarFileRead.t()
           | Polarex.Generated.ProductMediaFileRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def files_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Documented, :files_update},
      url: "/v1/files/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.FilePatch, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DownloadableFileRead, :t},
            {Polarex.Generated.OrganizationAvatarFileRead, :t},
            {Polarex.Generated.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Complete File Upload

  Complete a file upload.

  **Scopes**: `files:write`
  """
  @spec files_uploaded(String.t(), Polarex.Generated.FileUploadCompleted.t(), keyword) ::
          {:ok,
           Polarex.Generated.DownloadableFileRead.t()
           | Polarex.Generated.OrganizationAvatarFileRead.t()
           | Polarex.Generated.ProductMediaFileRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def files_uploaded(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Documented, :files_uploaded},
      url: "/v1/files/#{id}/uploaded",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.FileUploadCompleted, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DownloadableFileRead, :t},
            {Polarex.Generated.OrganizationAvatarFileRead, :t},
            {Polarex.Generated.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
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
      call: {Polarex.Generated.Documented, :license_keys_get},
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
      call: {Polarex.Generated.Documented, :license_keys_get_activation},
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
      call: {Polarex.Generated.Documented, :license_keys_list},
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
      call: {Polarex.Generated.Documented, :license_keys_update},
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
      call: {Polarex.Generated.Documented, :meters_create},
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
      call: {Polarex.Generated.Documented, :meters_get},
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
      call: {Polarex.Generated.Documented, :meters_list},
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
      call: {Polarex.Generated.Documented, :meters_quantities},
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
      call: {Polarex.Generated.Documented, :meters_update},
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
          {:ok, Polarex.Generated.MetricsResponse.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
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
      call: {Polarex.Generated.Documented, :metrics_get},
      url: "/v1/metrics/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.MetricsResponse, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Metrics Limits

  Get the interval limits for the metrics endpoint.

  **Scopes**: `metrics:read`
  """
  @spec metrics_limits(keyword) :: {:ok, Polarex.Generated.MetricsLimits.t()} | :error
  def metrics_limits(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :metrics_limits},
      url: "/v1/metrics/limits",
      method: :get,
      response: [{200, {Polarex.Generated.MetricsLimits, :t}}],
      opts: opts
    })
  end

  @doc """
  Authorize
  """
  @spec oauth2_authorize(keyword) ::
          {:ok,
           Polarex.Generated.AuthorizeResponseOrganization.t()
           | Polarex.Generated.AuthorizeResponseUser.t()}
          | :error
  def oauth2_authorize(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :oauth2_authorize},
      url: "/v1/oauth2/authorize",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.AuthorizeResponseOrganization, :t},
            {Polarex.Generated.AuthorizeResponseUser, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  List Clients

  List OAuth2 clients.

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec oauth2_clients_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceOAuth2Client.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :oauth2_clients_list},
      url: "/v1/oauth2/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceOAuth2Client, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client

  Create an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_create_client(
          Polarex.Generated.OAuth2ClientConfiguration.t(),
          keyword
        ) :: {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_create_client(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Documented, :oauth2_clients_oauth2_create_client},
      url: "/v1/oauth2/register",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.OAuth2ClientConfiguration, :t}}],
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Client

  Delete an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_delete_client(String.t(), keyword) ::
          {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_delete_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Generated.Documented, :oauth2_clients_oauth2_delete_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :delete,
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Client

  Get an OAuth2 client by Client ID.
  """
  @spec oauth2_clients_oauth2_get_client(String.t(), keyword) ::
          {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_get_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Generated.Documented, :oauth2_clients_oauth2_get_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :get,
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update Client

  Update an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_update_client(
          String.t(),
          Polarex.Generated.OAuth2ClientConfigurationUpdate.t(),
          keyword
        ) :: {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_update_client(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {Polarex.Generated.Documented, :oauth2_clients_oauth2_update_client},
      url: "/v1/oauth2/register/#{client_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Polarex.Generated.OAuth2ClientConfigurationUpdate, :t}}],
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
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
      call: {Polarex.Generated.Documented, :oauth2_introspect_token},
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
      call: {Polarex.Generated.Documented, :oauth2_request_token},
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
      call: {Polarex.Generated.Documented, :oauth2_revoke_token},
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
      call: {Polarex.Generated.Documented, :oauth2_userinfo},
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
      call: {Polarex.Generated.Documented, :orders_get},
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
      call: {Polarex.Generated.Documented, :orders_invoice},
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
      call: {Polarex.Generated.Documented, :orders_list},
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
      call: {Polarex.Generated.Documented, :organizations_create},
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
      call: {Polarex.Generated.Documented, :organizations_get},
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
      call: {Polarex.Generated.Documented, :organizations_list},
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
      call: {Polarex.Generated.Documented, :organizations_update},
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
  Get Payment

  Get a payment by ID.

  **Scopes**: `payments:read`
  """
  @spec payments_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CardPayment.t() | Polarex.Generated.GenericPayment.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def payments_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :payments_get},
      url: "/v1/payments/#{id}",
      method: :get,
      response: [
        {200,
         {:union, [{Polarex.Generated.CardPayment, :t}, {Polarex.Generated.GenericPayment, :t}]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.ListResource.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
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
      call: {Polarex.Generated.Documented, :payments_list},
      url: "/v1/payments/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResource, :t}},
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
      call: {Polarex.Generated.Documented, :products_create},
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
      call: {Polarex.Generated.Documented, :products_get},
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
      call: {Polarex.Generated.Documented, :products_list},
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
      call: {Polarex.Generated.Documented, :products_update},
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
      call: {Polarex.Generated.Documented, :products_update_benefits},
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

  @doc """
  Create Refund

  Create a refund.

  **Scopes**: `refunds:write`
  """
  @spec refunds_create(Polarex.Generated.RefundCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Refund.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.RefundAmountTooHigh.t()
             | Polarex.Generated.RefundedAlready.t()}
  def refunds_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Documented, :refunds_create},
      url: "/v1/refunds/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.RefundCreate, :t}}],
      response: [
        {200, {Polarex.Generated.Refund, :t}},
        {201, :null},
        {400, {Polarex.Generated.RefundAmountTooHigh, :t}},
        {403, {Polarex.Generated.RefundedAlready, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Refunds

  List products.

  **Scopes**: `refunds:read` `refunds:write`

  ## Options

    * `id`: Filter by refund ID.
    * `organization_id`: Filter by organization ID.
    * `order_id`: Filter by order ID.
    * `subscription_id`: Filter by subscription ID.
    * `customer_id`: Filter by customer ID.
    * `succeeded`: Filter by `succeeded`.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec refunds_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceRefund.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def refunds_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :id,
        :limit,
        :order_id,
        :organization_id,
        :page,
        :sorting,
        :subscription_id,
        :succeeded
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :refunds_list},
      url: "/v1/refunds/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceRefund, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
  @spec subscriptions_export(keyword) ::
          {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def subscriptions_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Documented, :subscriptions_export},
      url: "/v1/subscriptions/export",
      method: :get,
      query: query,
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription by ID.

  **Scopes**: `subscriptions:write`
  """
  @spec subscriptions_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Subscription.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :subscriptions_get},
      url: "/v1/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Subscription, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.ListResourceSubscription.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
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
      call: {Polarex.Generated.Documented, :subscriptions_list},
      url: "/v1/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceSubscription, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.Subscription.t()}
          | {:error,
             Polarex.Generated.AlreadyCanceledSubscription.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def subscriptions_revoke(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Documented, :subscriptions_revoke},
      url: "/v1/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.Generated.Subscription, :t}},
        {403, {Polarex.Generated.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          Polarex.Generated.SubscriptionCancel.t()
          | Polarex.Generated.SubscriptionRevoke.t()
          | Polarex.Generated.SubscriptionUpdateProduct.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.Subscription.t()}
          | {:error,
             Polarex.Generated.AlreadyCanceledSubscription.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Documented, :subscriptions_update},
      url: "/v1/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.SubscriptionCancel, :t},
            {Polarex.Generated.SubscriptionRevoke, :t},
            {Polarex.Generated.SubscriptionUpdateProduct, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.Generated.Subscription, :t}},
        {403, {Polarex.Generated.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

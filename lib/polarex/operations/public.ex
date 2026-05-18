defmodule Polarex.Public do
  @moduledoc """
  Provides API endpoints related to public
  """

  @default_client Polarex.Support.Client

  @doc """
  List Benefit Grants

  List benefit grants across all benefits accessible to the authenticated subject.

  **Scopes**: `benefits:read` `benefits:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `is_granted`: Filter by granted status. If `true`, only granted benefits will be returned. If `false`, only revoked benefits will be returned. 
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec benefit_grants_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceBenefitGrant.t()} | {:error, Polarex.HTTPValidationError.t()}
  def benefit_grants_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :is_granted,
        :limit,
        :organization_id,
        :page,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :benefit_grants_list},
      url: "/v1/benefit-grants/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceBenefitGrant, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Benefit

  Create a benefit.

  **Scopes**: `benefits:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec benefits_create(
          body ::
            Polarex.BenefitCustomCreate.t()
            | Polarex.BenefitDiscordCreate.t()
            | Polarex.BenefitDownloadablesCreate.t()
            | Polarex.BenefitFeatureFlagCreate.t()
            | Polarex.BenefitGitHubRepositoryCreate.t()
            | Polarex.BenefitLicenseKeysCreate.t()
            | Polarex.BenefitMeterCreditCreate.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.BenefitCustom.t()
           | Polarex.BenefitDiscord.t()
           | Polarex.BenefitDownloadables.t()
           | Polarex.BenefitFeatureFlag.t()
           | Polarex.BenefitGitHubRepository.t()
           | Polarex.BenefitLicenseKeys.t()
           | Polarex.BenefitMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def benefits_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :benefits_create},
      url: "/v1/benefits/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.BenefitCustomCreate, :t},
            {Polarex.BenefitDiscordCreate, :t},
            {Polarex.BenefitDownloadablesCreate, :t},
            {Polarex.BenefitFeatureFlagCreate, :t},
            {Polarex.BenefitGitHubRepositoryCreate, :t},
            {Polarex.BenefitLicenseKeysCreate, :t},
            {Polarex.BenefitMeterCreditCreate, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.BenefitCustom, :t},
            {Polarex.BenefitDiscord, :t},
            {Polarex.BenefitDownloadables, :t},
            {Polarex.BenefitFeatureFlag, :t},
            {Polarex.BenefitGitHubRepository, :t},
            {Polarex.BenefitLicenseKeys, :t},
            {Polarex.BenefitMeterCredit, :t}
          ]}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec benefits_delete(id :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def benefits_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :benefits_delete},
      url: "/v1/benefits/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Benefit

  Get a benefit by ID.

  **Scopes**: `benefits:read` `benefits:write`
  """
  @spec benefits_get(id :: String.t(), opts :: keyword) ::
          {:ok,
           Polarex.BenefitCustom.t()
           | Polarex.BenefitDiscord.t()
           | Polarex.BenefitDownloadables.t()
           | Polarex.BenefitFeatureFlag.t()
           | Polarex.BenefitGitHubRepository.t()
           | Polarex.BenefitLicenseKeys.t()
           | Polarex.BenefitMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def benefits_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :benefits_get},
      url: "/v1/benefits/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.BenefitCustom, :t},
            {Polarex.BenefitDiscord, :t},
            {Polarex.BenefitDownloadables, :t},
            {Polarex.BenefitFeatureFlag, :t},
            {Polarex.BenefitGitHubRepository, :t},
            {Polarex.BenefitLicenseKeys, :t},
            {Polarex.BenefitMeterCredit, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
    * `member_id`: Filter by member.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec benefits_grants(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.ListResourceBenefitGrant.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def benefits_grants(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :is_granted, :limit, :member_id, :page])

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :benefits_grants},
      url: "/v1/benefits/#{id}/grants",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceBenefitGrant, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
    * `id`: Filter by benefit IDs.
    * `exclude_id`: Exclude benefits with these IDs.
    * `query`: Filter by description.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec benefits_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceBenefit.t()} | {:error, Polarex.HTTPValidationError.t()}
  def benefits_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :exclude_id,
        :id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :query,
        :sorting,
        :type
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :benefits_list},
      url: "/v1/benefits/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceBenefit, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Benefit

  Update a benefit.

  **Scopes**: `benefits:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec benefits_update(
          id :: String.t(),
          body ::
            Polarex.BenefitCustomUpdate.t()
            | Polarex.BenefitDiscordUpdate.t()
            | Polarex.BenefitDownloadablesUpdate.t()
            | Polarex.BenefitFeatureFlagUpdate.t()
            | Polarex.BenefitGitHubRepositoryUpdate.t()
            | Polarex.BenefitLicenseKeysUpdate.t()
            | Polarex.BenefitMeterCreditUpdate.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.BenefitCustom.t()
           | Polarex.BenefitDiscord.t()
           | Polarex.BenefitDownloadables.t()
           | Polarex.BenefitFeatureFlag.t()
           | Polarex.BenefitGitHubRepository.t()
           | Polarex.BenefitLicenseKeys.t()
           | Polarex.BenefitMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def benefits_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :benefits_update},
      url: "/v1/benefits/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.BenefitCustomUpdate, :t},
            {Polarex.BenefitDiscordUpdate, :t},
            {Polarex.BenefitDownloadablesUpdate, :t},
            {Polarex.BenefitFeatureFlagUpdate, :t},
            {Polarex.BenefitGitHubRepositoryUpdate, :t},
            {Polarex.BenefitLicenseKeysUpdate, :t},
            {Polarex.BenefitMeterCreditUpdate, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.BenefitCustom, :t},
            {Polarex.BenefitDiscord, :t},
            {Polarex.BenefitDownloadables, :t},
            {Polarex.BenefitFeatureFlag, :t},
            {Polarex.BenefitGitHubRepository, :t},
            {Polarex.BenefitLicenseKeys, :t},
            {Polarex.BenefitMeterCredit, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Checkout Link

  Create a checkout link.

  **Scopes**: `checkout_links:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec checkout_links_create(
          body ::
            Polarex.CheckoutLinkCreateProduct.t()
            | Polarex.CheckoutLinkCreateProductPrice.t()
            | Polarex.CheckoutLinkCreateProducts.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CheckoutLink.t()} | {:error, Polarex.HTTPValidationError.t()}
  def checkout_links_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :checkout_links_create},
      url: "/v1/checkout-links/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CheckoutLinkCreateProduct, :t},
            {Polarex.CheckoutLinkCreateProductPrice, :t},
            {Polarex.CheckoutLinkCreateProducts, :t}
          ]}}
      ],
      response: [{201, {Polarex.CheckoutLink, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Checkout Link

  Delete a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_delete(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def checkout_links_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :checkout_links_delete},
      url: "/v1/checkout-links/#{id}",
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
  Get Checkout Link

  Get a checkout link by ID.

  **Scopes**: `checkout_links:read` `checkout_links:write`
  """
  @spec checkout_links_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CheckoutLink.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def checkout_links_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :checkout_links_get},
      url: "/v1/checkout-links/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CheckoutLink, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec checkout_links_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCheckoutLink.t()} | {:error, Polarex.HTTPValidationError.t()}
  def checkout_links_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :product_id, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :checkout_links_list},
      url: "/v1/checkout-links/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCheckoutLink, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Link

  Update a checkout link.

  **Scopes**: `checkout_links:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec checkout_links_update(
          id :: String.t(),
          body :: Polarex.CheckoutLinkUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CheckoutLink.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def checkout_links_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :checkout_links_update},
      url: "/v1/checkout-links/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CheckoutLinkUpdate, :t}}],
      response: [
        {200, {Polarex.CheckoutLink, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Confirm Checkout Session from Client

  Confirm a checkout session by client secret.

  Orders and subscriptions will be processed.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec checkouts_client_confirm(
          client_secret :: String.t(),
          body :: Polarex.CheckoutConfirmStripe.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CheckoutPublicConfirmed.t()}
          | {:error,
             Polarex.AlreadyActiveSubscriptionError.t()
             | Polarex.ExpiredCheckoutError.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.NotOpenCheckout.t()
             | Polarex.PaymentError.t()
             | Polarex.PaymentNotReady.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.TrialAlreadyRedeemed.t()}
  def checkouts_client_confirm(client_secret, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret, body: body],
      call: {Polarex.Public, :checkouts_client_confirm},
      url: "/v1/checkouts/client/#{client_secret}/confirm",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CheckoutConfirmStripe, :t}}],
      response: [
        {200, {Polarex.CheckoutPublicConfirmed, :t}},
        {400, {Polarex.PaymentError, :t}},
        {403,
         {:union,
          [
            {Polarex.AlreadyActiveSubscriptionError, :t},
            {Polarex.NotOpenCheckout, :t},
            {Polarex.PaymentNotReady, :t},
            {Polarex.TrialAlreadyRedeemed, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {410, {Polarex.ExpiredCheckoutError, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Checkout Session from Client

  Get a checkout session by client secret.
  """
  @spec checkouts_client_get(client_secret :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CheckoutPublic.t()}
          | {:error,
             Polarex.ExpiredCheckoutError.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def checkouts_client_get(client_secret, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret],
      call: {Polarex.Public, :checkouts_client_get},
      url: "/v1/checkouts/client/#{client_secret}",
      method: :get,
      response: [
        {200, {Polarex.CheckoutPublic, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {410, {Polarex.ExpiredCheckoutError, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Session from Client

  Update a checkout session by client secret.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec checkouts_client_update(
          client_secret :: String.t(),
          body :: Polarex.CheckoutUpdatePublic.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CheckoutPublic.t()}
          | {:error,
             Polarex.AlreadyActiveSubscriptionError.t()
             | Polarex.ExpiredCheckoutError.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.NotOpenCheckout.t()
             | Polarex.PaymentNotReady.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.TrialAlreadyRedeemed.t()}
  def checkouts_client_update(client_secret, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret, body: body],
      call: {Polarex.Public, :checkouts_client_update},
      url: "/v1/checkouts/client/#{client_secret}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CheckoutUpdatePublic, :t}}],
      response: [
        {200, {Polarex.CheckoutPublic, :t}},
        {403,
         {:union,
          [
            {Polarex.AlreadyActiveSubscriptionError, :t},
            {Polarex.NotOpenCheckout, :t},
            {Polarex.PaymentNotReady, :t},
            {Polarex.TrialAlreadyRedeemed, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {410, {Polarex.ExpiredCheckoutError, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Checkout Session

  Create a checkout session.

  **Scopes**: `checkouts:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec checkouts_create(body :: Polarex.CheckoutProductsCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Checkout.t()} | {:error, Polarex.HTTPValidationError.t()}
  def checkouts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :checkouts_create},
      url: "/v1/checkouts/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CheckoutProductsCreate, :t}}],
      response: [{201, {Polarex.Checkout, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Checkout Session

  Get a checkout session by ID.

  **Scopes**: `checkouts:read` `checkouts:write`
  """
  @spec checkouts_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Checkout.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def checkouts_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :checkouts_get},
      url: "/v1/checkouts/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Checkout, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
    * `external_customer_id`: Filter by customer external ID.
    * `status`: Filter by checkout session status.
    * `query`: Filter by customer email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec checkouts_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCheckout.t()} | {:error, Polarex.HTTPValidationError.t()}
  def checkouts_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
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
      call: {Polarex.Public, :checkouts_list},
      url: "/v1/checkouts/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCheckout, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Session

  Update a checkout session.

  **Scopes**: `checkouts:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec checkouts_update(id :: String.t(), body :: Polarex.CheckoutUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Checkout.t()}
          | {:error,
             Polarex.AlreadyActiveSubscriptionError.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.NotOpenCheckout.t()
             | Polarex.PaymentNotReady.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.TrialAlreadyRedeemed.t()}
  def checkouts_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :checkouts_update},
      url: "/v1/checkouts/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CheckoutUpdate, :t}}],
      response: [
        {200, {Polarex.Checkout, :t}},
        {403,
         {:union,
          [
            {Polarex.AlreadyActiveSubscriptionError, :t},
            {Polarex.NotOpenCheckout, :t},
            {Polarex.PaymentNotReady, :t},
            {Polarex.TrialAlreadyRedeemed, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Custom Field

  Create a custom field.

  **Scopes**: `custom_fields:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec custom_fields_create(
          body ::
            Polarex.CustomFieldCreateCheckbox.t()
            | Polarex.CustomFieldCreateDate.t()
            | Polarex.CustomFieldCreateNumber.t()
            | Polarex.CustomFieldCreateSelect.t()
            | Polarex.CustomFieldCreateText.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.CustomFieldCheckbox.t()
           | Polarex.CustomFieldDate.t()
           | Polarex.CustomFieldNumber.t()
           | Polarex.CustomFieldSelect.t()
           | Polarex.CustomFieldText.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def custom_fields_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :custom_fields_create},
      url: "/v1/custom-fields/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomFieldCreateCheckbox, :t},
            {Polarex.CustomFieldCreateDate, :t},
            {Polarex.CustomFieldCreateNumber, :t},
            {Polarex.CustomFieldCreateSelect, :t},
            {Polarex.CustomFieldCreateText, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.CustomFieldCheckbox, :t},
            {Polarex.CustomFieldDate, :t},
            {Polarex.CustomFieldNumber, :t},
            {Polarex.CustomFieldSelect, :t},
            {Polarex.CustomFieldText, :t}
          ]}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Custom Field

  Delete a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_delete(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def custom_fields_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :custom_fields_delete},
      url: "/v1/custom-fields/#{id}",
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
  Get Custom Field

  Get a custom field by ID.

  **Scopes**: `custom_fields:read` `custom_fields:write`
  """
  @spec custom_fields_get(id :: String.t(), opts :: keyword) ::
          {:ok,
           Polarex.CustomFieldCheckbox.t()
           | Polarex.CustomFieldDate.t()
           | Polarex.CustomFieldNumber.t()
           | Polarex.CustomFieldSelect.t()
           | Polarex.CustomFieldText.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def custom_fields_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :custom_fields_get},
      url: "/v1/custom-fields/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomFieldCheckbox, :t},
            {Polarex.CustomFieldDate, :t},
            {Polarex.CustomFieldNumber, :t},
            {Polarex.CustomFieldSelect, :t},
            {Polarex.CustomFieldText, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec custom_fields_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomField.t()} | {:error, Polarex.HTTPValidationError.t()}
  def custom_fields_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting, :type])

    client.request(%{
      args: [],
      call: {Polarex.Public, :custom_fields_list},
      url: "/v1/custom-fields/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomField, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Custom Field

  Update a custom field.

  **Scopes**: `custom_fields:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec custom_fields_update(
          id :: String.t(),
          body ::
            Polarex.CustomFieldUpdateCheckbox.t()
            | Polarex.CustomFieldUpdateDate.t()
            | Polarex.CustomFieldUpdateNumber.t()
            | Polarex.CustomFieldUpdateSelect.t()
            | Polarex.CustomFieldUpdateText.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.CustomFieldCheckbox.t()
           | Polarex.CustomFieldDate.t()
           | Polarex.CustomFieldNumber.t()
           | Polarex.CustomFieldSelect.t()
           | Polarex.CustomFieldText.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def custom_fields_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :custom_fields_update},
      url: "/v1/custom-fields/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomFieldUpdateCheckbox, :t},
            {Polarex.CustomFieldUpdateDate, :t},
            {Polarex.CustomFieldUpdateNumber, :t},
            {Polarex.CustomFieldUpdateSelect, :t},
            {Polarex.CustomFieldUpdateText, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomFieldCheckbox, :t},
            {Polarex.CustomFieldDate, :t},
            {Polarex.CustomFieldNumber, :t},
            {Polarex.CustomFieldSelect, :t},
            {Polarex.CustomFieldText, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer Meter

  Get a customer meter by ID.

  **Scopes**: `customer_meters:read`
  """
  @spec customer_meters_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_meters_get},
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
  @spec customer_meters_list(opts :: keyword) ::
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
      call: {Polarex.Public, :customer_meters_list},
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
  Get Benefit Grant

  Get a benefit grant by ID for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_benefit_grants_get(id :: String.t(), opts :: keyword) ::
          {:ok,
           Polarex.CustomerBenefitGrantCustom.t()
           | Polarex.CustomerBenefitGrantDiscord.t()
           | Polarex.CustomerBenefitGrantDownloadables.t()
           | Polarex.CustomerBenefitGrantFeatureFlag.t()
           | Polarex.CustomerBenefitGrantGitHubRepository.t()
           | Polarex.CustomerBenefitGrantLicenseKeys.t()
           | Polarex.CustomerBenefitGrantMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_benefit_grants_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_benefit_grants_get},
      url: "/v1/customer-portal/benefit-grants/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomerBenefitGrantCustom, :t},
            {Polarex.CustomerBenefitGrantDiscord, :t},
            {Polarex.CustomerBenefitGrantDownloadables, :t},
            {Polarex.CustomerBenefitGrantFeatureFlag, :t},
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

    * `query`: Filter by benefit description.
    * `type`: Filter by benefit type.
    * `benefit_id`: Filter by benefit ID.
    * `checkout_id`: Filter by checkout ID.
    * `order_id`: Filter by order ID.
    * `subscription_id`: Filter by subscription ID.
    * `member_id`: Filter by member ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_benefit_grants_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerBenefitGrant.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_benefit_grants_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :benefit_id,
        :checkout_id,
        :limit,
        :member_id,
        :order_id,
        :page,
        :query,
        :sorting,
        :subscription_id,
        :type
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_benefit_grants_list},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_benefit_grants_update(
          id :: String.t(),
          body ::
            Polarex.CustomerBenefitGrantCustomUpdate.t()
            | Polarex.CustomerBenefitGrantDiscordUpdate.t()
            | Polarex.CustomerBenefitGrantDownloadablesUpdate.t()
            | Polarex.CustomerBenefitGrantFeatureFlagUpdate.t()
            | Polarex.CustomerBenefitGrantGitHubRepositoryUpdate.t()
            | Polarex.CustomerBenefitGrantLicenseKeysUpdate.t()
            | Polarex.CustomerBenefitGrantMeterCreditUpdate.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.CustomerBenefitGrantCustom.t()
           | Polarex.CustomerBenefitGrantDiscord.t()
           | Polarex.CustomerBenefitGrantDownloadables.t()
           | Polarex.CustomerBenefitGrantFeatureFlag.t()
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
      call: {Polarex.Public, :customer_portal_benefit_grants_update},
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
            {Polarex.CustomerBenefitGrantFeatureFlagUpdate, :t},
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
            {Polarex.CustomerBenefitGrantFeatureFlag, :t},
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
  @spec customer_portal_customer_meters_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerCustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_customer_meters_get},
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
  @spec customer_portal_customer_meters_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerCustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_customer_meters_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :meter_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_customer_meters_list},
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
  Get Authenticated Portal User

  Get information about the currently authenticated portal user.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_session_get_authenticated_user(opts :: keyword) ::
          {:ok, Polarex.PortalAuthenticatedUser.t()} | :error
  def customer_portal_customer_session_get_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_customer_session_get_authenticated_user},
      url: "/v1/customer-portal/customer-session/user",
      method: :get,
      response: [{200, {Polarex.PortalAuthenticatedUser, :t}}],
      opts: opts
    })
  end

  @doc """
  Introspect Customer Session

  Introspect the current session and return its information.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_session_introspect(opts :: keyword) ::
          {:ok, Polarex.CustomerCustomerSession.t()} | :error
  def customer_portal_customer_session_introspect(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_customer_session_introspect},
      url: "/v1/customer-portal/customer-session/introspect",
      method: :get,
      response: [{200, {Polarex.CustomerCustomerSession, :t}}],
      opts: opts
    })
  end

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
      call: {Polarex.Public, :customer_portal_customers_add_payment_method},
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
      call: {Polarex.Public, :customer_portal_customers_check_email_update},
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
      call: {Polarex.Public, :customer_portal_customers_confirm_payment_method},
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
      call: {Polarex.Public, :customer_portal_customers_delete_payment_method},
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
      call: {Polarex.Public, :customer_portal_customers_get},
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
      call: {Polarex.Public, :customer_portal_customers_list_payment_methods},
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
      call: {Polarex.Public, :customer_portal_customers_request_email_update},
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
      call: {Polarex.Public, :customer_portal_customers_update},
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
      call: {Polarex.Public, :customer_portal_customers_verify_email_update},
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
  List Downloadables

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `benefit_id`: Filter by benefit ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_downloadables_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceDownloadableRead.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_downloadables_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_downloadables_list},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_license_keys_activate(
          body :: Polarex.LicenseKeyActivate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_activate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_portal_license_keys_activate},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_license_keys_deactivate(
          body :: Polarex.LicenseKeyDeactivate.t(),
          opts :: keyword
        ) :: :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_deactivate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_portal_license_keys_deactivate},
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
  @spec customer_portal_license_keys_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.LicenseKeyWithActivations.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_license_keys_get},
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
  @spec customer_portal_license_keys_list(opts :: keyword) ::
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
      call: {Polarex.Public, :customer_portal_license_keys_list},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_license_keys_validate(
          body :: Polarex.LicenseKeyValidate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.ValidatedLicenseKey.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_license_keys_validate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_portal_license_keys_validate},
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
  Add Member

  Add a new member to the customer's team.

  Only available to owners and billing managers of team customers.

  Rules:
  - Cannot add a member with the owner role (there must be exactly one owner)
  - If a member with this email already exists, the existing member is returned

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_members_add_member(
          body :: Polarex.CustomerPortalMemberCreate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerPortalMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_add_member(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_portal_members_add_member},
      url: "/v1/customer-portal/members",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerPortalMemberCreate, :t}}],
      response: [
        {201, {Polarex.CustomerPortalMember, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Members

  List all members of the customer's team.

  Only available to owners and billing managers of team customers.

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_members_list_members(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerPortalMember.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_list_members(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_members_list_members},
      url: "/v1/customer-portal/members",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerPortalMember, :t}},
        {401, :null},
        {403, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove Member

  Remove a member from the team.

  Only available to owners and billing managers of team customers.

  Rules:
  - Cannot remove yourself
  - Cannot remove the only owner
  """
  @spec customer_portal_members_remove_member(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_remove_member(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_members_remove_member},
      url: "/v1/customer-portal/members/#{id}",
      method: :delete,
      response: [
        {204, :null},
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
  Update Member

  Update a member's role.

  Only available to owners and billing managers of team customers.

  Rules:
  - Cannot modify your own role (to prevent self-demotion)
  - Customer must have exactly one owner at all times

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_members_update_member(
          id :: String.t(),
          body :: Polarex.CustomerPortalMemberUpdate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerPortalMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_update_member(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :customer_portal_members_update_member},
      url: "/v1/customer-portal/members/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerPortalMemberUpdate, :t}}],
      response: [
        {200, {Polarex.CustomerPortalMember, :t}},
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
      call: {Polarex.Public, :customer_portal_orders_confirm_retry_payment},
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
      call: {Polarex.Public, :customer_portal_orders_generate_invoice},
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
      call: {Polarex.Public, :customer_portal_orders_get},
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
      call: {Polarex.Public, :customer_portal_orders_get_payment_status},
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
      call: {Polarex.Public, :customer_portal_orders_invoice},
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
      call: {Polarex.Public, :customer_portal_orders_list},
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
      call: {Polarex.Public, :customer_portal_orders_receipt},
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
      call: {Polarex.Public, :customer_portal_orders_update},
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
  @spec customer_portal_organizations_get(slug :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerOrganizationData.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_organizations_get(slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [slug: slug],
      call: {Polarex.Public, :customer_portal_organizations_get},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_seats_assign_seat(body :: Polarex.CustomerSeatAssign.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_assign_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_portal_seats_assign_seat},
      url: "/v1/customer-portal/seats",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerSeatAssign, :t}}],
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

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_seats_list_claimed_subscriptions(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_list_claimed_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_seats_list_claimed_subscriptions},
      url: "/v1/customer-portal/seats/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerSubscription, :t}},
        {401, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
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
  @spec customer_portal_seats_list_seats(opts :: keyword) ::
          {:ok, Polarex.SeatsList.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_list_seats(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order_id, :subscription_id])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_seats_list_seats},
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
  """
  @spec customer_portal_seats_resend_invitation(seat_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_resend_invitation(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.Public, :customer_portal_seats_resend_invitation},
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
  """
  @spec customer_portal_seats_revoke_seat(seat_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_revoke_seat(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.Public, :customer_portal_seats_revoke_seat},
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
  """
  @spec customer_portal_subscriptions_cancel(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_cancel(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_subscriptions_cancel},
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
  @spec customer_portal_subscriptions_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_subscriptions_get},
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
  @spec customer_portal_subscriptions_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:active, :limit, :page, :product_id, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_subscriptions_list},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_subscriptions_update(
          id :: String.t(),
          body ::
            Polarex.CustomerSubscriptionCancel.t()
            | Polarex.CustomerSubscriptionUpdateClear.t()
            | Polarex.CustomerSubscriptionUpdateProduct.t()
            | Polarex.CustomerSubscriptionUpdateSeats.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.PaymentFailed.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :customer_portal_subscriptions_update},
      url: "/v1/customer-portal/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomerSubscriptionCancel, :t},
            {Polarex.CustomerSubscriptionUpdateClear, :t},
            {Polarex.CustomerSubscriptionUpdateProduct, :t},
            {Polarex.CustomerSubscriptionUpdateSeats, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {402, {Polarex.PaymentFailed, :t}},
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
  """
  @spec customer_portal_wallets_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerWallet.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_wallets_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :customer_portal_wallets_get},
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

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_wallets_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerWallet.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_wallets_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_portal_wallets_list},
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

  @doc """
  Assign Seat

  **Scopes**: `customer_seats:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_seats_assign_seat(body :: Polarex.SeatAssign.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_assign_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_seats_assign_seat},
      url: "/v1/customer-seats",
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
  Claim Seat

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_seats_claim_seat(body :: Polarex.SeatClaim.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeatClaimResponse.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_claim_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_seats_claim_seat},
      url: "/v1/customer-seats/claim",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.SeatClaim, :t}}],
      response: [
        {200, {Polarex.CustomerSeatClaimResponse, :t}},
        {400, :null},
        {403, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Claim Info
  """
  @spec customer_seats_get_claim_info(invitation_token :: String.t(), opts :: keyword) ::
          {:ok, Polarex.SeatClaimInfo.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_get_claim_info(invitation_token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [invitation_token: invitation_token],
      call: {Polarex.Public, :customer_seats_get_claim_info},
      url: "/v1/customer-seats/claim/#{invitation_token}",
      method: :get,
      response: [
        {200, {Polarex.SeatClaimInfo, :t}},
        {400, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Seats

  **Scopes**: `customer_seats:write`

  ## Options

    * `subscription_id`
    * `order_id`

  """
  @spec customer_seats_list_seats(opts :: keyword) ::
          {:ok, Polarex.SeatsList.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_list_seats(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order_id, :subscription_id])

    client.request(%{
      args: [],
      call: {Polarex.Public, :customer_seats_list_seats},
      url: "/v1/customer-seats",
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

  **Scopes**: `customer_seats:write`
  """
  @spec customer_seats_resend_invitation(seat_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_resend_invitation(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.Public, :customer_seats_resend_invitation},
      url: "/v1/customer-seats/#{seat_id}/resend",
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

  **Scopes**: `customer_seats:write`
  """
  @spec customer_seats_revoke_seat(seat_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_revoke_seat(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.Public, :customer_seats_revoke_seat},
      url: "/v1/customer-seats/#{seat_id}",
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
  Create Customer Session

  Create a customer session.

  For organizations with `member_model_enabled`, this will automatically
  create a member session for the owner member of the customer.

  **Scopes**: `customer_sessions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_sessions_create(
          body ::
            Polarex.CustomerSessionCustomerExternalIDCreate.t()
            | Polarex.CustomerSessionCustomerIDCreate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerSession.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_sessions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :customer_sessions_create},
      url: "/v1/customer-sessions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomerSessionCustomerExternalIDCreate, :t},
            {Polarex.CustomerSessionCustomerIDCreate, :t}
          ]}}
      ],
      response: [{201, {Polarex.CustomerSession, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
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
      call: {Polarex.Public, :customers_create},
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
      call: {Polarex.Public, :customers_delete},
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
      call: {Polarex.Public, :customers_delete_external},
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
      call: {Polarex.Public, :customers_export},
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
      call: {Polarex.Public, :customers_get},
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
      call: {Polarex.Public, :customers_get_external},
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
      call: {Polarex.Public, :customers_get_state},
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
      call: {Polarex.Public, :customers_get_state_external},
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
      call: {Polarex.Public, :customers_list},
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
      call: {Polarex.Public, :customers_update},
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
      call: {Polarex.Public, :customers_update_external},
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

  @doc """
  Create Discount

  Create a discount.

  **Scopes**: `discounts:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec discounts_create(
          body :: Polarex.DiscountFixedCreate.t() | Polarex.DiscountPercentageCreate.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.DiscountFixedOnceForeverDuration.t()
           | Polarex.DiscountFixedRepeatDuration.t()
           | Polarex.DiscountPercentageOnceForeverDuration.t()
           | Polarex.DiscountPercentageRepeatDuration.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def discounts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :discounts_create},
      url: "/v1/discounts/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{Polarex.DiscountFixedCreate, :t}, {Polarex.DiscountPercentageCreate, :t}]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.DiscountFixedOnceForeverDuration, :t},
            {Polarex.DiscountFixedRepeatDuration, :t},
            {Polarex.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.DiscountPercentageRepeatDuration, :t}
          ]}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Discount

  Delete a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_delete(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def discounts_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :discounts_delete},
      url: "/v1/discounts/#{id}",
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
  Get Discount

  Get a discount by ID.

  **Scopes**: `discounts:read` `discounts:write`
  """
  @spec discounts_get(id :: String.t(), opts :: keyword) ::
          {:ok,
           Polarex.DiscountFixedOnceForeverDuration.t()
           | Polarex.DiscountFixedRepeatDuration.t()
           | Polarex.DiscountPercentageOnceForeverDuration.t()
           | Polarex.DiscountPercentageRepeatDuration.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def discounts_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :discounts_get},
      url: "/v1/discounts/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.DiscountFixedOnceForeverDuration, :t},
            {Polarex.DiscountFixedRepeatDuration, :t},
            {Polarex.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.DiscountPercentageRepeatDuration, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec discounts_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceDiscount.t()} | {:error, Polarex.HTTPValidationError.t()}
  def discounts_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :discounts_list},
      url: "/v1/discounts/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceDiscount, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Discount

  Update a discount.

  **Scopes**: `discounts:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec discounts_update(id :: String.t(), body :: Polarex.DiscountUpdate.t(), opts :: keyword) ::
          {:ok,
           Polarex.DiscountFixedOnceForeverDuration.t()
           | Polarex.DiscountFixedRepeatDuration.t()
           | Polarex.DiscountPercentageOnceForeverDuration.t()
           | Polarex.DiscountPercentageRepeatDuration.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def discounts_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :discounts_update},
      url: "/v1/discounts/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.DiscountUpdate, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.DiscountFixedOnceForeverDuration, :t},
            {Polarex.DiscountFixedRepeatDuration, :t},
            {Polarex.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.DiscountPercentageRepeatDuration, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Dispute

  Get a dispute by ID.

  **Scopes**: `disputes:read`
  """
  @spec disputes_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Dispute.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def disputes_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :disputes_get},
      url: "/v1/disputes/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Dispute, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Disputes

  List disputes.

  **Scopes**: `disputes:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `order_id`: Filter by order ID.
    * `status`: Filter by dispute status.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec disputes_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceDispute.t()} | {:error, Polarex.HTTPValidationError.t()}
  def disputes_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :order_id, :organization_id, :page, :sorting, :status])

    client.request(%{
      args: [],
      call: {Polarex.Public, :disputes_list},
      url: "/v1/disputes/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceDispute, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Event Types

  List event types with aggregated statistics.

  **Scopes**: `events:read` `events:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `query`: Query to filter event types by name or label.
    * `root_events`: When true, only return event types with root events (parent_id IS NULL).
    * `parent_id`: Filter by specific parent event ID.
    * `source`: Filter by event source (system or user).
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec event_types_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceEventTypeWithStats.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def event_types_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :limit,
        :organization_id,
        :page,
        :parent_id,
        :query,
        :root_events,
        :sorting,
        :source
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :event_types_list},
      url: "/v1/event-types/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceEventTypeWithStats, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Event Type

  Update an event type's label.

  **Scopes**: `events:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec event_types_update(id :: String.t(), body :: Polarex.EventTypeUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.EventType.t()} | {:error, Polarex.HTTPValidationError.t()}
  def event_types_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :event_types_update},
      url: "/v1/event-types/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.EventTypeUpdate, :t}}],
      response: [
        {200, {Polarex.EventType, :t}},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Event

  Get an event by ID.

  **Scopes**: `events:read` `events:write`
  """
  @spec events_get(id :: String.t(), opts :: keyword) ::
          {:ok, map | Polarex.UserEvent.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def events_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :events_get},
      url: "/v1/events/#{id}",
      method: :get,
      response: [
        {200, {:union, [:map, {Polarex.UserEvent, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Ingest Events

  Ingest batch of events.

  **Scopes**: `events:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec events_ingest(body :: Polarex.EventsIngest.t(), opts :: keyword) ::
          {:ok, Polarex.EventsIngestResponse.t()} | {:error, Polarex.HTTPValidationError.t()}
  def events_ingest(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :events_ingest},
      url: "/v1/events/ingest",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.EventsIngest, :t}}],
      response: [
        {200, {Polarex.EventsIngestResponse, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
    * `query`: Query to filter events.
    * `parent_id`: When combined with depth, use this event as the anchor instead of root events.
    * `depth`: Fetch descendants up to this depth. When set: 0=root events only, 1=roots+children, etc. Max 5. When not set, returns all events.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec events_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceEvent.t() | Polarex.ListResourceWithCursorPaginationEvent.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def events_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :depth,
        :end_timestamp,
        :external_customer_id,
        :filter,
        :limit,
        :metadata,
        :meter_id,
        :name,
        :organization_id,
        :page,
        :parent_id,
        :query,
        :sorting,
        :source,
        :start_timestamp
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :events_list},
      url: "/v1/events/",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [{Polarex.ListResourceEvent, :t}, {Polarex.ListResourceWithCursorPaginationEvent, :t}]}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec events_list_names(opts :: keyword) ::
          {:ok, Polarex.ListResourceEventName.t()} | {:error, Polarex.HTTPValidationError.t()}
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
      call: {Polarex.Public, :events_list_names},
      url: "/v1/events/names",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceEventName, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create File

  Create a file.

  **Scopes**: `files:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec files_create(
          body ::
            Polarex.DownloadableFileCreate.t()
            | Polarex.OrganizationAvatarFileCreate.t()
            | Polarex.ProductMediaFileCreate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.FileUpload.t()} | {:error, Polarex.HTTPValidationError.t()}
  def files_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :files_create},
      url: "/v1/files/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.DownloadableFileCreate, :t},
            {Polarex.OrganizationAvatarFileCreate, :t},
            {Polarex.ProductMediaFileCreate, :t}
          ]}}
      ],
      response: [{201, {Polarex.FileUpload, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete File

  Delete a file.

  **Scopes**: `files:write`
  """
  @spec files_delete(id :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def files_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :files_delete},
      url: "/v1/files/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec files_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceFileRead.t()} | {:error, Polarex.HTTPValidationError.t()}
  def files_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Public, :files_list},
      url: "/v1/files/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceFileRead, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update File

  Update a file.

  **Scopes**: `files:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec files_update(id :: String.t(), body :: Polarex.FilePatch.t(), opts :: keyword) ::
          {:ok,
           Polarex.DownloadableFileRead.t()
           | Polarex.OrganizationAvatarFileRead.t()
           | Polarex.ProductMediaFileRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def files_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :files_update},
      url: "/v1/files/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.FilePatch, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.DownloadableFileRead, :t},
            {Polarex.OrganizationAvatarFileRead, :t},
            {Polarex.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Complete File Upload

  Complete a file upload.

  **Scopes**: `files:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec files_uploaded(id :: String.t(), body :: Polarex.FileUploadCompleted.t(), opts :: keyword) ::
          {:ok,
           Polarex.DownloadableFileRead.t()
           | Polarex.OrganizationAvatarFileRead.t()
           | Polarex.ProductMediaFileRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def files_uploaded(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :files_uploaded},
      url: "/v1/files/#{id}/uploaded",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.FileUploadCompleted, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.DownloadableFileRead, :t},
            {Polarex.OrganizationAvatarFileRead, :t},
            {Polarex.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Activate License Key

  Activate a license key instance.

  **Scopes**: `license_keys:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec license_keys_activate(body :: Polarex.LicenseKeyActivate.t(), opts :: keyword) ::
          {:ok, Polarex.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def license_keys_activate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :license_keys_activate},
      url: "/v1/license-keys/activate",
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

  **Scopes**: `license_keys:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec license_keys_deactivate(body :: Polarex.LicenseKeyDeactivate.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def license_keys_deactivate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :license_keys_deactivate},
      url: "/v1/license-keys/deactivate",
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

  **Scopes**: `license_keys:read` `license_keys:write`
  """
  @spec license_keys_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.LicenseKeyWithActivations.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.Unauthorized.t()}
  def license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :license_keys_get},
      url: "/v1/license-keys/#{id}",
      method: :get,
      response: [
        {200, {Polarex.LicenseKeyWithActivations, :t}},
        {401, {Polarex.Unauthorized, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Activation

  Get a license key activation.

  **Scopes**: `license_keys:read` `license_keys:write`
  """
  @spec license_keys_get_activation(
          id :: String.t(),
          activation_id :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.Unauthorized.t()}
  def license_keys_get_activation(id, activation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, activation_id: activation_id],
      call: {Polarex.Public, :license_keys_get_activation},
      url: "/v1/license-keys/#{id}/activations/#{activation_id}",
      method: :get,
      response: [
        {200, {Polarex.LicenseKeyActivationRead, :t}},
        {401, {Polarex.Unauthorized, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
    * `status`: Filter by license key status.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec license_keys_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceLicenseKeyRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.Unauthorized.t()}
  def license_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page, :status])

    client.request(%{
      args: [],
      call: {Polarex.Public, :license_keys_list},
      url: "/v1/license-keys/",
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
  Update License Key

  Update a license key.

  **Scopes**: `license_keys:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec license_keys_update(
          id :: String.t(),
          body :: Polarex.LicenseKeyUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.LicenseKeyRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.Unauthorized.t()}
  def license_keys_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :license_keys_update},
      url: "/v1/license-keys/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.LicenseKeyUpdate, :t}}],
      response: [
        {200, {Polarex.LicenseKeyRead, :t}},
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

  **Scopes**: `license_keys:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec license_keys_validate(body :: Polarex.LicenseKeyValidate.t(), opts :: keyword) ::
          {:ok, Polarex.ValidatedLicenseKey.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def license_keys_validate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :license_keys_validate},
      url: "/v1/license-keys/validate",
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
  Create Member

  Create a new member for a customer.

  Only B2B customers with the member management feature enabled can add members.
  The authenticated user or organization must have access to the customer's organization.

  **Scopes**: `members:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec members_create_member(body :: Polarex.MemberCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_create_member(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :members_create_member},
      url: "/v1/members/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.MemberCreate, :t}}],
      response: [
        {201, {Polarex.Member, :t}},
        {403, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Member

  Delete a member.

  The authenticated user or organization must have access to the member's organization.

  **Scopes**: `members:write`
  """
  @spec members_delete_member(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_delete_member(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :members_delete_member},
      url: "/v1/members/#{id}",
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
  Delete Member by External ID

  Delete a member by external ID. One of customer_id or external_customer_id must be specified.

  **Scopes**: `members:write`

  ## Options

    * `customer_id`: The customer ID.
    * `external_customer_id`: The customer external ID.

  """
  @spec members_delete_member_by_external_id(external_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_delete_member_by_external_id(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :external_customer_id])

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Public, :members_delete_member_by_external_id},
      url: "/v1/members/external/#{external_id}",
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
  Get Member

  Get a member by ID.

  The authenticated user or organization must have access to the member's organization.

  **Scopes**: `members:read` `members:write`
  """
  @spec members_get_member(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_get_member(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :members_get_member},
      url: "/v1/members/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Member by External ID

  Get a member by external ID. One of customer_id or external_customer_id must be specified.

  **Scopes**: `members:read` `members:write`

  ## Options

    * `customer_id`: The customer ID.
    * `external_customer_id`: The customer external ID.

  """
  @spec members_get_member_by_external_id(external_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_get_member_by_external_id(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :external_customer_id])

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Public, :members_get_member_by_external_id},
      url: "/v1/members/external/#{external_id}",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Members

  List members with optional customer ID filter.

  **Scopes**: `members:read` `members:write`

  ## Options

    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `role`: Filter by member role.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec members_list_members(opts :: keyword) ::
          {:ok, Polarex.ListResourceMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def members_list_members(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:customer_id, :external_customer_id, :limit, :page, :role, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :members_list_members},
      url: "/v1/members/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceMember, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Member

  Update a member.

  Only name and role can be updated.
  The authenticated user or organization must have access to the member's organization.

  **Scopes**: `members:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec members_update_member(id :: String.t(), body :: Polarex.MemberUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_update_member(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :members_update_member},
      url: "/v1/members/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.MemberUpdate, :t}}],
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Member by External ID

  Update a member by external ID. One of customer_id or external_customer_id must be specified.

  **Scopes**: `members:write`

  ## Options

    * `customer_id`: The customer ID.
    * `external_customer_id`: The customer external ID.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec members_update_member_by_external_id(
          external_id :: String.t(),
          body :: Polarex.MemberUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_update_member_by_external_id(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :external_customer_id])

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Polarex.Public, :members_update_member_by_external_id},
      url: "/v1/members/external/#{external_id}",
      body: body,
      method: :patch,
      query: query,
      request: [{"application/json", {Polarex.MemberUpdate, :t}}],
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Meter

  Create a meter.

  **Scopes**: `meters:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec meters_create(body :: Polarex.MeterCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Meter.t()} | {:error, Polarex.HTTPValidationError.t()}
  def meters_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :meters_create},
      url: "/v1/meters/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.MeterCreate, :t}}],
      response: [{201, {Polarex.Meter, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Meter

  Get a meter by ID.

  **Scopes**: `meters:read` `meters:write`
  """
  @spec meters_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Meter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :meters_get},
      url: "/v1/meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Meter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
    * `is_archived`: Filter on archived meters.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec meters_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceMeter.t()} | {:error, Polarex.HTTPValidationError.t()}
  def meters_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :is_archived,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :query,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :meters_list},
      url: "/v1/meters/",
      method: :get,
      query: query,
      response: [{200, {Polarex.ListResourceMeter, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
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
    * `timezone`: Timezone to use for the timestamps. Default is UTC.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `customer_aggregation_function`: If set, will first compute the quantities per customer before aggregating them using the given function. If not set, the quantities will be aggregated across all events.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec meters_quantities(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.MeterQuantities.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def meters_quantities(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_aggregation_function,
        :customer_id,
        :end_timestamp,
        :external_customer_id,
        :interval,
        :metadata,
        :start_timestamp,
        :timezone
      ])

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :meters_quantities},
      url: "/v1/meters/#{id}/quantities",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.MeterQuantities, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Meter

  Update a meter.

  **Scopes**: `meters:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec meters_update(id :: String.t(), body :: Polarex.MeterUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Meter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def meters_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :meters_update},
      url: "/v1/meters/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.MeterUpdate, :t}}],
      response: [
        {200, {Polarex.Meter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Metric Dashboard

  Create a user-defined metric dashboard.

  **Scopes**: `metrics:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec metrics_create_dashboard(body :: Polarex.MetricDashboardCreate.t(), opts :: keyword) ::
          {:ok, Polarex.MetricDashboardSchema.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_create_dashboard(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :metrics_create_dashboard},
      url: "/v1/metrics/dashboards",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.MetricDashboardCreate, :t}}],
      response: [
        {201, {Polarex.MetricDashboardSchema, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Metric Dashboard

  Delete a user-defined metric dashboard.

  **Scopes**: `metrics:write`
  """
  @spec metrics_delete_dashboard(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def metrics_delete_dashboard(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :metrics_delete_dashboard},
      url: "/v1/metrics/dashboards/#{id}",
      method: :delete,
      response: [{204, :null}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Export Metrics

  Export metrics as a CSV file.

  **Scopes**: `metrics:read`

  ## Options

    * `start_date`: Start date.
    * `end_date`: End date.
    * `timezone`: Timezone to use for the timestamps. Default is UTC.
    * `interval`: Interval between two timestamps.
    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `billing_type`: Filter by billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `customer_id`: Filter by customer ID.
    * `metrics`: List of metric slugs to include in the export. If not provided, all metrics are exported.

  """
  @spec metrics_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_export(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billing_type,
        :customer_id,
        :end_date,
        :interval,
        :metrics,
        :organization_id,
        :product_id,
        :start_date,
        :timezone
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :metrics_export},
      url: "/v1/metrics/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
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
    * `timezone`: Timezone to use for the timestamps. Default is UTC.
    * `interval`: Interval between two timestamps.
    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `billing_type`: Filter by billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `customer_id`: Filter by customer ID.
    * `metrics`: List of metric slugs to focus on. When provided, only the queries needed for these metrics will be executed, improving performance. If not provided, all metrics are returned.

  """
  @spec metrics_get(opts :: keyword) ::
          {:ok, Polarex.MetricsResponse.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_get(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billing_type,
        :customer_id,
        :end_date,
        :interval,
        :metrics,
        :organization_id,
        :product_id,
        :start_date,
        :timezone
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :metrics_get},
      url: "/v1/metrics/",
      method: :get,
      query: query,
      response: [{200, {Polarex.MetricsResponse, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Metric Dashboard

  Get a user-defined metric dashboard by ID.

  **Scopes**: `metrics:read`
  """
  @spec metrics_get_dashboard(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.MetricDashboardSchema.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_get_dashboard(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :metrics_get_dashboard},
      url: "/v1/metrics/dashboards/#{id}",
      method: :get,
      response: [
        {200, {Polarex.MetricDashboardSchema, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Metrics Limits

  Get the interval limits for the metrics endpoint.

  **Scopes**: `metrics:read`
  """
  @spec metrics_limits(opts :: keyword) :: {:ok, Polarex.MetricsLimits.t()} | :error
  def metrics_limits(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Public, :metrics_limits},
      url: "/v1/metrics/limits",
      method: :get,
      response: [{200, {Polarex.MetricsLimits, :t}}],
      opts: opts
    })
  end

  @doc """
  List Metric Dashboards

  List user-defined metric dashboards.

  **Scopes**: `metrics:read`

  ## Options

    * `organization_id`: Filter by organization ID.

  """
  @spec metrics_list_dashboards(opts :: keyword) ::
          {:ok, [Polarex.MetricDashboardSchema.t()]} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_list_dashboards(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Public, :metrics_list_dashboards},
      url: "/v1/metrics/dashboards",
      method: :get,
      query: query,
      response: [
        {200, [{Polarex.MetricDashboardSchema, :t}]},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Metric Dashboard

  Update a user-defined metric dashboard.

  **Scopes**: `metrics:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec metrics_update_dashboard(
          id :: String.t(),
          body :: Polarex.MetricDashboardUpdate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.MetricDashboardSchema.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_update_dashboard(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :metrics_update_dashboard},
      url: "/v1/metrics/dashboards/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.MetricDashboardUpdate, :t}}],
      response: [
        {200, {Polarex.MetricDashboardSchema, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Authorize
  """
  @spec oauth2_authorize(opts :: keyword) ::
          {:ok, Polarex.AuthorizeResponseOrganization.t() | Polarex.AuthorizeResponseUser.t()}
          | :error
  def oauth2_authorize(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Public, :oauth2_authorize},
      url: "/v1/oauth2/authorize",
      method: :get,
      response: [
        {200,
         {:union,
          [{Polarex.AuthorizeResponseOrganization, :t}, {Polarex.AuthorizeResponseUser, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client

  Create an OAuth2 client.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec oauth2_clients_oauth2_create_client(
          body :: Polarex.OAuth2ClientConfiguration.t(),
          opts :: keyword
        ) :: {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_create_client(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :oauth2_clients_oauth2_create_client},
      url: "/v1/oauth2/register",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.OAuth2ClientConfiguration, :t}}],
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Client

  Delete an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_delete_client(client_id :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_delete_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Public, :oauth2_clients_oauth2_delete_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :delete,
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Client

  Get an OAuth2 client by Client ID.
  """
  @spec oauth2_clients_oauth2_get_client(client_id :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_get_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Public, :oauth2_clients_oauth2_get_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :get,
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update Client

  Update an OAuth2 client.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec oauth2_clients_oauth2_update_client(
          client_id :: String.t(),
          body :: Polarex.OAuth2ClientConfigurationUpdate.t(),
          opts :: keyword
        ) :: {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_update_client(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {Polarex.Public, :oauth2_clients_oauth2_update_client},
      url: "/v1/oauth2/register/#{client_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Polarex.OAuth2ClientConfigurationUpdate, :t}}],
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Introspect Token

  Get information about an access token.

  ## Request Body

  **Content Types**: `application/x-www-form-urlencoded`
  """
  @spec oauth2_introspect_token(body :: Polarex.IntrospectTokenRequest.t(), opts :: keyword) ::
          {:ok, Polarex.IntrospectTokenResponse.t()} | :error
  def oauth2_introspect_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :oauth2_introspect_token},
      url: "/v1/oauth2/introspect",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", {Polarex.IntrospectTokenRequest, :t}}],
      response: [{200, {Polarex.IntrospectTokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Request Token

  Request an access token using a valid grant.

  ## Request Body

  **Content Types**: `application/x-www-form-urlencoded`
  """
  @spec oauth2_request_token(
          body ::
            Polarex.AuthorizationCodeTokenRequest.t()
            | Polarex.RefreshTokenRequest.t()
            | Polarex.WebTokenRequest.t(),
          opts :: keyword
        ) :: {:ok, Polarex.TokenResponse.t()} | :error
  def oauth2_request_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :oauth2_request_token},
      url: "/v1/oauth2/token",
      body: body,
      method: :post,
      request: [
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {Polarex.AuthorizationCodeTokenRequest, :t},
            {Polarex.RefreshTokenRequest, :t},
            {Polarex.WebTokenRequest, :t}
          ]}}
      ],
      response: [{200, {Polarex.TokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Revoke Token

  Revoke an access token or a refresh token.

  ## Request Body

  **Content Types**: `application/x-www-form-urlencoded`
  """
  @spec oauth2_revoke_token(body :: Polarex.RevokeTokenRequest.t(), opts :: keyword) ::
          {:ok, map} | :error
  def oauth2_revoke_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :oauth2_revoke_token},
      url: "/v1/oauth2/revoke",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", {Polarex.RevokeTokenRequest, :t}}],
      response: [{200, :map}],
      opts: opts
    })
  end

  @doc """
  Get User Info

  Get information about the authenticated user.
  """
  @spec oauth2_userinfo(opts :: keyword) ::
          {:ok, Polarex.UserInfoOrganization.t() | Polarex.UserInfoUser.t()} | :error
  def oauth2_userinfo(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Public, :oauth2_userinfo},
      url: "/v1/oauth2/userinfo",
      method: :get,
      response: [
        {200, {:union, [{Polarex.UserInfoOrganization, :t}, {Polarex.UserInfoUser, :t}]}}
      ],
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
      call: {Polarex.Public, :orders_export},
      url: "/v1/orders/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
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
      call: {Polarex.Public, :orders_generate_invoice},
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
      call: {Polarex.Public, :orders_get},
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
      call: {Polarex.Public, :orders_invoice},
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
      call: {Polarex.Public, :orders_list},
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
      call: {Polarex.Public, :orders_receipt},
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
      call: {Polarex.Public, :orders_update},
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

  @doc """
  Create

  **Scopes**: `organization_access_tokens:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec organization_access_tokens_create(
          body :: Polarex.OrganizationAccessTokenCreate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.OrganizationAccessTokenCreateResponse.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def organization_access_tokens_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :organization_access_tokens_create},
      url: "/v1/organization-access-tokens/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.OrganizationAccessTokenCreate, :t}}],
      response: [
        {201, {Polarex.OrganizationAccessTokenCreateResponse, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete

  **Scopes**: `organization_access_tokens:write`
  """
  @spec organization_access_tokens_delete(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def organization_access_tokens_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :organization_access_tokens_delete},
      url: "/v1/organization-access-tokens/#{id}",
      method: :delete,
      response: [{204, :null}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  List

  List organization access tokens.

  **Scopes**: `organization_access_tokens:read` `organization_access_tokens:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec organization_access_tokens_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceOrganizationAccessToken.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def organization_access_tokens_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :organization_access_tokens_list},
      url: "/v1/organization-access-tokens/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceOrganizationAccessToken, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update

  **Scopes**: `organization_access_tokens:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec organization_access_tokens_update(
          id :: String.t(),
          body :: Polarex.OrganizationAccessTokenUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.OrganizationAccessToken.t()} | {:error, Polarex.HTTPValidationError.t()}
  def organization_access_tokens_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :organization_access_tokens_update},
      url: "/v1/organization-access-tokens/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.OrganizationAccessTokenUpdate, :t}}],
      response: [
        {200, {Polarex.OrganizationAccessToken, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Organization

  Create an organization.

  **Scopes**: `organizations:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec organizations_create(body :: Polarex.OrganizationCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Organization.t()} | {:error, Polarex.HTTPValidationError.t()}
  def organizations_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :organizations_create},
      url: "/v1/organizations/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.OrganizationCreate, :t}}],
      response: [{201, {Polarex.Organization, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Organization

  Get an organization by ID.

  **Scopes**: `organizations:read` `organizations:write`
  """
  @spec organizations_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Organization.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def organizations_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :organizations_get},
      url: "/v1/organizations/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Organization, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
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
  @spec organizations_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceOrganization.t()} | {:error, Polarex.HTTPValidationError.t()}
  def organizations_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :slug, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Public, :organizations_list},
      url: "/v1/organizations/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceOrganization, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Organization

  Update an organization.

  **Scopes**: `organizations:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec organizations_update(
          id :: String.t(),
          body :: Polarex.OrganizationUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Organization.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def organizations_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :organizations_update},
      url: "/v1/organizations/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.OrganizationUpdate, :t}}],
      response: [
        {200, {Polarex.Organization, :t}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Payment

  Get a payment by ID.

  **Scopes**: `payments:read`
  """
  @spec payments_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CardPayment.t() | Polarex.GenericPayment.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def payments_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :payments_get},
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
  @spec payments_list(opts :: keyword) ::
          {:ok, Polarex.ListResourcePayment.t()} | {:error, Polarex.HTTPValidationError.t()}
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
      call: {Polarex.Public, :payments_list},
      url: "/v1/payments/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourcePayment, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Product

  Create a product.

  **Scopes**: `products:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec products_create(
          body :: Polarex.ProductCreateOneTime.t() | Polarex.ProductCreateRecurring.t(),
          opts :: keyword
        ) :: {:ok, Polarex.Product.t()} | {:error, Polarex.HTTPValidationError.t()}
  def products_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :products_create},
      url: "/v1/products/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{Polarex.ProductCreateOneTime, :t}, {Polarex.ProductCreateRecurring, :t}]}}
      ],
      response: [{201, {Polarex.Product, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Product

  Get a product by ID.

  **Scopes**: `products:read` `products:write`
  """
  @spec products_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def products_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :products_get},
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
    * `visibility`: Filter by visibility.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec products_list(opts :: keyword) ::
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
        :metadata,
        :organization_id,
        :page,
        :query,
        :sorting,
        :visibility
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :products_list},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec products_update(id :: String.t(), body :: Polarex.ProductUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def products_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :products_update},
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec products_update_benefits(
          id :: String.t(),
          body :: Polarex.ProductBenefitsUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Product.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def products_update_benefits(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :products_update_benefits},
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
  Create Refund

  Create a refund.

  **Scopes**: `refunds:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec refunds_create(body :: Polarex.RefundCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Refund.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.RefundedAlready.t()}
  def refunds_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :refunds_create},
      url: "/v1/refunds/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.RefundCreate, :t}}],
      response: [
        {201, {Polarex.Refund, :t}},
        {403, {Polarex.RefundedAlready, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Refunds

  List refunds.

  **Scopes**: `refunds:read` `refunds:write`

  ## Options

    * `id`: Filter by refund ID.
    * `organization_id`: Filter by organization ID.
    * `order_id`: Filter by order ID.
    * `subscription_id`: Filter by subscription ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `succeeded`: Filter by `succeeded`.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec refunds_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceRefund.t()} | {:error, Polarex.HTTPValidationError.t()}
  def refunds_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
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
      call: {Polarex.Public, :refunds_list},
      url: "/v1/refunds/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceRefund, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Subscription

  Create a subscription programmatically.

  This endpoint only allows to create subscription on free products.
  For paid products, use the checkout flow.

  No initial order will be created and no confirmation email will be sent.

  **Scopes**: `subscriptions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec subscriptions_create(
          body ::
            Polarex.SubscriptionCreateCustomer.t()
            | Polarex.SubscriptionCreateExternalCustomer.t(),
          opts :: keyword
        ) :: {:ok, Polarex.Subscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :subscriptions_create},
      url: "/v1/subscriptions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCreateCustomer, :t},
            {Polarex.SubscriptionCreateExternalCustomer, :t}
          ]}}
      ],
      response: [{201, {Polarex.Subscription, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
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
  @spec subscriptions_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Public, :subscriptions_export},
      url: "/v1/subscriptions/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription by ID.

  **Scopes**: `subscriptions:read` `subscriptions:write`
  """
  @spec subscriptions_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :subscriptions_get},
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
    * `external_customer_id`: Filter by customer external ID.
    * `discount_id`: Filter by discount ID.
    * `active`: Filter by active or inactive subscription.
    * `cancel_at_period_end`: Filter by subscriptions that are set to cancel at period end.
    * `customer_cancellation_reason`: Filter by customer cancellation reason.
    * `canceled_at_after`: Filter by cancellation date (after or equal to).
    * `canceled_at_before`: Filter by cancellation date (before or equal to).
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec subscriptions_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceSubscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :active,
        :cancel_at_period_end,
        :canceled_at_after,
        :canceled_at_before,
        :customer_cancellation_reason,
        :customer_id,
        :discount_id,
        :external_customer_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_id,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :subscriptions_list},
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
  @spec subscriptions_revoke(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.SubscriptionLocked.t()}
  def subscriptions_revoke(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :subscriptions_revoke},
      url: "/v1/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.Subscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.SubscriptionLocked, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Subscription

  Update a subscription.

  **Scopes**: `subscriptions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec subscriptions_update(
          id :: String.t(),
          body ::
            Polarex.SubscriptionCancel.t()
            | Polarex.SubscriptionRevoke.t()
            | Polarex.SubscriptionUpdateBillingPeriod.t()
            | Polarex.SubscriptionUpdateClear.t()
            | Polarex.SubscriptionUpdateDiscount.t()
            | Polarex.SubscriptionUpdateProduct.t()
            | Polarex.SubscriptionUpdateSeats.t()
            | Polarex.SubscriptionUpdateTrial.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.PaymentFailed.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.SubscriptionLocked.t()}
  def subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :subscriptions_update},
      url: "/v1/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCancel, :t},
            {Polarex.SubscriptionRevoke, :t},
            {Polarex.SubscriptionUpdateBillingPeriod, :t},
            {Polarex.SubscriptionUpdateClear, :t},
            {Polarex.SubscriptionUpdateDiscount, :t},
            {Polarex.SubscriptionUpdateProduct, :t},
            {Polarex.SubscriptionUpdateSeats, :t},
            {Polarex.SubscriptionUpdateTrial, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.Subscription, :t}},
        {402, {Polarex.PaymentFailed, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.SubscriptionLocked, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Webhook Endpoint

  Create a webhook endpoint.

  **Scopes**: `webhooks:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec webhooks_create_webhook_endpoint(
          body :: Polarex.WebhookEndpointCreate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.WebhookEndpoint.t()} | {:error, Polarex.HTTPValidationError.t()}
  def webhooks_create_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Public, :webhooks_create_webhook_endpoint},
      url: "/v1/webhooks/endpoints",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.WebhookEndpointCreate, :t}}],
      response: [{201, {Polarex.WebhookEndpoint, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Webhook Endpoint

  Delete a webhook endpoint.

  **Scopes**: `webhooks:write`
  """
  @spec webhooks_delete_webhook_endpoint(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_delete_webhook_endpoint(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :webhooks_delete_webhook_endpoint},
      url: "/v1/webhooks/endpoints/#{id}",
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
  Get Webhook Endpoint

  Get a webhook endpoint by ID.

  **Scopes**: `webhooks:read` `webhooks:write`
  """
  @spec webhooks_get_webhook_endpoint(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.WebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_get_webhook_endpoint(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :webhooks_get_webhook_endpoint},
      url: "/v1/webhooks/endpoints/#{id}",
      method: :get,
      response: [
        {200, {Polarex.WebhookEndpoint, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Webhook Deliveries

  List webhook deliveries.

  Deliveries are all the attempts to deliver a webhook event to an endpoint.

  **Scopes**: `webhooks:read` `webhooks:write`

  ## Options

    * `endpoint_id`: Filter by webhook endpoint ID.
    * `start_timestamp`: Filter deliveries after this timestamp.
    * `end_timestamp`: Filter deliveries before this timestamp.
    * `succeeded`: Filter by delivery success status.
    * `query`: Query to filter webhook deliveries.
    * `http_code_class`: Filter by HTTP response code class (2xx, 3xx, 4xx, 5xx).
    * `event_type`: Filter by webhook event type.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec webhooks_list_webhook_deliveries(opts :: keyword) ::
          {:ok, Polarex.ListResourceWebhookDelivery.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def webhooks_list_webhook_deliveries(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :end_timestamp,
        :endpoint_id,
        :event_type,
        :http_code_class,
        :limit,
        :page,
        :query,
        :start_timestamp,
        :succeeded
      ])

    client.request(%{
      args: [],
      call: {Polarex.Public, :webhooks_list_webhook_deliveries},
      url: "/v1/webhooks/deliveries",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceWebhookDelivery, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Webhook Endpoints

  List webhook endpoints.

  **Scopes**: `webhooks:read` `webhooks:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec webhooks_list_webhook_endpoints(opts :: keyword) ::
          {:ok, Polarex.ListResourceWebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def webhooks_list_webhook_endpoints(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Public, :webhooks_list_webhook_endpoints},
      url: "/v1/webhooks/endpoints",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceWebhookEndpoint, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Redeliver Webhook Event

  Schedule the re-delivery of a webhook event.

  **Scopes**: `webhooks:write`
  """
  @spec webhooks_redeliver_webhook_event(id :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_redeliver_webhook_event(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :webhooks_redeliver_webhook_event},
      url: "/v1/webhooks/events/#{id}/redeliver",
      method: :post,
      response: [
        {202, :map},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset Webhook Endpoint Secret

  Regenerate a webhook endpoint secret.

  **Scopes**: `webhooks:write`
  """
  @spec webhooks_reset_webhook_endpoint_secret(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.WebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_reset_webhook_endpoint_secret(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Public, :webhooks_reset_webhook_endpoint_secret},
      url: "/v1/webhooks/endpoints/#{id}/secret",
      method: :patch,
      response: [
        {200, {Polarex.WebhookEndpoint, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Webhook Endpoint

  Update a webhook endpoint.

  **Scopes**: `webhooks:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec webhooks_update_webhook_endpoint(
          id :: String.t(),
          body :: Polarex.WebhookEndpointUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.WebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_update_webhook_endpoint(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Public, :webhooks_update_webhook_endpoint},
      url: "/v1/webhooks/endpoints/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.WebhookEndpointUpdate, :t}}],
      response: [
        {200, {Polarex.WebhookEndpoint, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

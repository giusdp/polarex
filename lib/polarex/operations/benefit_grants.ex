defmodule Polarex.BenefitGrants do
  @moduledoc """
  Provides API endpoints related to benefit grants
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
      call: {Polarex.BenefitGrants, :benefit_grants_list},
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
           | Polarex.CustomerBenefitGrantMeterCredit.t()
           | Polarex.CustomerBenefitGrantSlackSharedChannel.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_benefit_grants_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.BenefitGrants, :customer_portal_benefit_grants_get},
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
            {Polarex.CustomerBenefitGrantMeterCredit, :t},
            {Polarex.CustomerBenefitGrantSlackSharedChannel, :t}
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
      call: {Polarex.BenefitGrants, :customer_portal_benefit_grants_list},
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
            | Polarex.CustomerBenefitGrantMeterCreditUpdate.t()
            | Polarex.CustomerBenefitGrantSlackSharedChannelUpdate.t(),
          opts :: keyword
        ) ::
          {:ok,
           Polarex.CustomerBenefitGrantCustom.t()
           | Polarex.CustomerBenefitGrantDiscord.t()
           | Polarex.CustomerBenefitGrantDownloadables.t()
           | Polarex.CustomerBenefitGrantFeatureFlag.t()
           | Polarex.CustomerBenefitGrantGitHubRepository.t()
           | Polarex.CustomerBenefitGrantLicenseKeys.t()
           | Polarex.CustomerBenefitGrantMeterCredit.t()
           | Polarex.CustomerBenefitGrantSlackSharedChannel.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_benefit_grants_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.BenefitGrants, :customer_portal_benefit_grants_update},
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
            {Polarex.CustomerBenefitGrantMeterCreditUpdate, :t},
            {Polarex.CustomerBenefitGrantSlackSharedChannelUpdate, :t}
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
            {Polarex.CustomerBenefitGrantMeterCredit, :t},
            {Polarex.CustomerBenefitGrantSlackSharedChannel, :t}
          ]}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

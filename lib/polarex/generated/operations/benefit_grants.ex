defmodule Polarex.Generated.BenefitGrants do
  @moduledoc """
  Provides API endpoints related to benefit grants
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
      call: {Polarex.Generated.BenefitGrants, :customer_portal_benefit_grants_get},
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
      call: {Polarex.Generated.BenefitGrants, :customer_portal_benefit_grants_list},
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
      call: {Polarex.Generated.BenefitGrants, :customer_portal_benefit_grants_update},
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
end

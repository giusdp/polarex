defmodule Polarex.Generated.Benefits do
  @moduledoc """
  Provides API endpoints related to benefits
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
      call: {Polarex.Generated.Benefits, :benefits_create},
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
      call: {Polarex.Generated.Benefits, :benefits_delete},
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
      call: {Polarex.Generated.Benefits, :benefits_get},
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
      call: {Polarex.Generated.Benefits, :benefits_grants},
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
      call: {Polarex.Generated.Benefits, :benefits_list},
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
      call: {Polarex.Generated.Benefits, :benefits_update},
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
end

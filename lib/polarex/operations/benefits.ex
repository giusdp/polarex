defmodule Polarex.Benefits do
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
          Polarex.BenefitCustomCreate.t()
          | Polarex.BenefitDiscordCreate.t()
          | Polarex.BenefitDownloadablesCreate.t()
          | Polarex.BenefitGitHubRepositoryCreate.t()
          | Polarex.BenefitLicenseKeysCreate.t()
          | Polarex.BenefitMeterCreditCreate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.BenefitCustom.t()
           | Polarex.BenefitDiscord.t()
           | Polarex.BenefitDownloadables.t()
           | Polarex.BenefitGitHubRepository.t()
           | Polarex.BenefitLicenseKeys.t()
           | Polarex.BenefitMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def benefits_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Benefits, :benefits_create},
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
  @spec benefits_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def benefits_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Benefits, :benefits_delete},
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
  @spec benefits_get(String.t(), keyword) ::
          {:ok,
           Polarex.BenefitCustom.t()
           | Polarex.BenefitDiscord.t()
           | Polarex.BenefitDownloadables.t()
           | Polarex.BenefitGitHubRepository.t()
           | Polarex.BenefitLicenseKeys.t()
           | Polarex.BenefitMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def benefits_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Benefits, :benefits_get},
      url: "/v1/benefits/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.BenefitCustom, :t},
            {Polarex.BenefitDiscord, :t},
            {Polarex.BenefitDownloadables, :t},
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
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec benefits_grants(String.t(), keyword) ::
          {:ok, Polarex.ListResourceBenefitGrant.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def benefits_grants(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :is_granted, :limit, :page])

    client.request(%{
      args: [id: id],
      call: {Polarex.Benefits, :benefits_grants},
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
    * `query`: Filter by description.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec benefits_list(keyword) ::
          {:ok, Polarex.ListResourceBenefit.t()} | {:error, Polarex.HTTPValidationError.t()}
  def benefits_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting, :type])

    client.request(%{
      args: [],
      call: {Polarex.Benefits, :benefits_list},
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
  """
  @spec benefits_update(
          String.t(),
          Polarex.BenefitCustomUpdate.t()
          | Polarex.BenefitDiscordUpdate.t()
          | Polarex.BenefitDownloadablesUpdate.t()
          | Polarex.BenefitGitHubRepositoryUpdate.t()
          | Polarex.BenefitLicenseKeysUpdate.t()
          | Polarex.BenefitMeterCreditUpdate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.BenefitCustom.t()
           | Polarex.BenefitDiscord.t()
           | Polarex.BenefitDownloadables.t()
           | Polarex.BenefitGitHubRepository.t()
           | Polarex.BenefitLicenseKeys.t()
           | Polarex.BenefitMeterCredit.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def benefits_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Benefits, :benefits_update},
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
end

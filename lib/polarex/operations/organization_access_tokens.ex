defmodule Polarex.OrganizationAccessTokens do
  @moduledoc """
  Provides API endpoints related to organization access tokens
  """

  @default_client Polarex.Support.Client

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
      call: {Polarex.OrganizationAccessTokens, :organization_access_tokens_create},
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
      call: {Polarex.OrganizationAccessTokens, :organization_access_tokens_delete},
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
      call: {Polarex.OrganizationAccessTokens, :organization_access_tokens_list},
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
      call: {Polarex.OrganizationAccessTokens, :organization_access_tokens_update},
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
end

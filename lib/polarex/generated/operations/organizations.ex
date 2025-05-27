defmodule Polarex.Generated.Organizations do
  @moduledoc """
  Provides API endpoints related to organizations
  """

  @default_client Polarex.Support.Client

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
      call: {Polarex.Generated.Organizations, :customer_portal_organizations_get},
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
      call: {Polarex.Generated.Organizations, :organizations_create},
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
      call: {Polarex.Generated.Organizations, :organizations_get},
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
      call: {Polarex.Generated.Organizations, :organizations_list},
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
      call: {Polarex.Generated.Organizations, :organizations_update},
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
end

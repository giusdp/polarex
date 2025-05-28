defmodule Polarex.Downloadables do
  @moduledoc """
  Provides API endpoints related to downloadables
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Downloadable
  """
  @spec customer_portal_downloadables_customer_portal_downloadables_get(String.t(), keyword) ::
          {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_downloadables_customer_portal_downloadables_get(token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [token: token],
      call:
        {Polarex.Downloadables, :customer_portal_downloadables_customer_portal_downloadables_get},
      url: "/v1/customer-portal/downloadables/#{token}",
      method: :get,
      response: [
        {200, :map},
        {302, :null},
        {400, :null},
        {404, :null},
        {410, :null},
        {422, {Polarex.HTTPValidationError, :t}}
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
          {:ok, Polarex.ListResourceDownloadableRead.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_downloadables_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Downloadables, :customer_portal_downloadables_list},
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
end

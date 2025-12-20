defmodule Polarex.Disputes do
  @moduledoc """
  Provides API endpoints related to disputes
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Dispute

  Get a dispute by ID.

  **Scopes**: `disputes:read`
  """
  @spec disputes_get(String.t(), keyword) ::
          {:ok, Polarex.Dispute.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def disputes_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Disputes, :disputes_get},
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
  @spec disputes_list(keyword) ::
          {:ok, Polarex.ListResourceDispute.t()} | {:error, Polarex.HTTPValidationError.t()}
  def disputes_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :order_id, :organization_id, :page, :sorting, :status])

    client.request(%{
      args: [],
      call: {Polarex.Disputes, :disputes_list},
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
end

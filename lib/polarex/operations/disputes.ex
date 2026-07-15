defmodule Polarex.Disputes do
  @moduledoc """
  Provides API endpoints related to disputes
  """

  @default_client Polarex.Support.Client

  @doc """
  Accept Dispute

  Accept a dispute, conceding the chargeback.

  Closes the dispute with the processor (settling it as `lost`) and records
  the merchant's decision on the dispute's support case.

  **Scopes**: `disputes:write`
  """
  @spec disputes_accept(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Dispute.t()}
          | {:error,
             Polarex.DisputeNotOpenError.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def disputes_accept(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Disputes, :disputes_accept},
      url: "/v1/disputes/#{id}/accept",
      method: :post,
      response: [
        {200, {Polarex.Dispute, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.DisputeNotOpenError, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Dispute

  Get a dispute by ID.

  **Scopes**: `disputes:read` `disputes:write`
  """
  @spec disputes_get(id :: String.t(), opts :: keyword) ::
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

  **Scopes**: `disputes:read` `disputes:write`

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

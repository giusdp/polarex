defmodule Polarex.Members do
  @moduledoc """
  Provides API endpoints related to members
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Member

  Create a new member for a customer.

  Only B2B customers with the member management feature enabled can add members.
  The authenticated user or organization must have access to the customer's organization.

  **Scopes**: `members:write`
  """
  @spec members_create_member(Polarex.MemberCreate.t(), keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_create_member(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Members, :members_create_member},
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
  @spec members_delete_member(String.t(), keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_delete_member(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Members, :members_delete_member},
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
  List Members

  List members with optional customer ID filter.

  **Scopes**: `members:read` `members:write`

  ## Options

    * `customer_id`: Filter by customer ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec members_list_members(keyword) ::
          {:ok, Polarex.ListResourceMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def members_list_members(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :limit, :page, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Members, :members_list_members},
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
end

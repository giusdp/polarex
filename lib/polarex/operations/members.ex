defmodule Polarex.Members do
  @moduledoc """
  Provides API endpoints related to members
  """

  @default_client Polarex.Support.Client

  @doc """
  Add Member

  Add a new member to the customer's team.

  Only available to owners and billing managers of team customers.

  Rules:
  - Cannot add a member with the owner role (there must be exactly one owner)
  - If a member with this email already exists, the existing member is returned

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_members_add_member(
          body :: Polarex.CustomerPortalMemberCreate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerPortalMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_add_member(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Members, :customer_portal_members_add_member},
      url: "/v1/customer-portal/members",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerPortalMemberCreate, :t}}],
      response: [
        {201, {Polarex.CustomerPortalMember, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Members

  List all members of the customer's team.

  Only available to owners and billing managers of team customers.

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_members_list_members(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerPortalMember.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_list_members(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Members, :customer_portal_members_list_members},
      url: "/v1/customer-portal/members",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerPortalMember, :t}},
        {401, :null},
        {403, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove Member

  Remove a member from the team.

  Only available to owners and billing managers of team customers.

  Rules:
  - Cannot remove yourself
  - Cannot remove the only owner
  """
  @spec customer_portal_members_remove_member(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_remove_member(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Members, :customer_portal_members_remove_member},
      url: "/v1/customer-portal/members/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Member

  Update a member's role.

  Only available to owners and billing managers of team customers.

  Rules:
  - Cannot modify your own role (to prevent self-demotion)
  - Customer must have exactly one owner at all times

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_members_update_member(
          id :: String.t(),
          body :: Polarex.CustomerPortalMemberUpdate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.CustomerPortalMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_members_update_member(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Members, :customer_portal_members_update_member},
      url: "/v1/customer-portal/members/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerPortalMemberUpdate, :t}}],
      response: [
        {200, {Polarex.CustomerPortalMember, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Member

  Create a new member for a customer.

  Only B2B customers with the member management feature enabled can add members.
  The authenticated user or organization must have access to the customer's organization.

  **Scopes**: `members:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec members_create_member(body :: Polarex.MemberCreate.t(), opts :: keyword) ::
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
  @spec members_delete_member(id :: String.t(), opts :: keyword) ::
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
  Delete Member by External ID

  Delete a member by external ID. One of customer_id or external_customer_id must be specified.

  **Scopes**: `members:write`

  ## Options

    * `customer_id`: The customer ID.
    * `external_customer_id`: The customer external ID.

  """
  @spec members_delete_member_by_external_id(external_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_delete_member_by_external_id(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :external_customer_id])

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Members, :members_delete_member_by_external_id},
      url: "/v1/members/external/#{external_id}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Member

  Get a member by ID.

  The authenticated user or organization must have access to the member's organization.

  **Scopes**: `members:read` `members:write`
  """
  @spec members_get_member(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_get_member(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Members, :members_get_member},
      url: "/v1/members/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Member by External ID

  Get a member by external ID. One of customer_id or external_customer_id must be specified.

  **Scopes**: `members:read` `members:write`

  ## Options

    * `customer_id`: The customer ID.
    * `external_customer_id`: The customer external ID.

  """
  @spec members_get_member_by_external_id(external_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_get_member_by_external_id(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :external_customer_id])

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Members, :members_get_member_by_external_id},
      url: "/v1/members/external/#{external_id}",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Member, :t}},
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
    * `external_customer_id`: Filter by customer external ID.
    * `role`: Filter by member role.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec members_list_members(opts :: keyword) ::
          {:ok, Polarex.ListResourceMember.t()} | {:error, Polarex.HTTPValidationError.t()}
  def members_list_members(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:customer_id, :external_customer_id, :limit, :page, :role, :sorting])

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

  @doc """
  Update Member

  Update a member.

  Only name and role can be updated.
  The authenticated user or organization must have access to the member's organization.

  **Scopes**: `members:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec members_update_member(id :: String.t(), body :: Polarex.MemberUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_update_member(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Members, :members_update_member},
      url: "/v1/members/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.MemberUpdate, :t}}],
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Member by External ID

  Update a member by external ID. One of customer_id or external_customer_id must be specified.

  **Scopes**: `members:write`

  ## Options

    * `customer_id`: The customer ID.
    * `external_customer_id`: The customer external ID.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec members_update_member_by_external_id(
          external_id :: String.t(),
          body :: Polarex.MemberUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Member.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def members_update_member_by_external_id(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :external_customer_id])

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Polarex.Members, :members_update_member_by_external_id},
      url: "/v1/members/external/#{external_id}",
      body: body,
      method: :patch,
      query: query,
      request: [{"application/json", {Polarex.MemberUpdate, :t}}],
      response: [
        {200, {Polarex.Member, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

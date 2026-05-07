defmodule Polarex.Mcp do
  @moduledoc """
  Provides API endpoints related to mcp
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Customer Meter

  Get a customer meter by ID.

  **Scopes**: `customer_meters:read`
  """
  @spec customer_meters_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerMeter.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_meters_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customer_meters_get},
      url: "/v1/customer-meters/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerMeter, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Customer Meters

  List customer meters.

  **Scopes**: `customer_meters:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `meter_id`: Filter by meter ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_meters_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerMeter.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_meters_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :limit,
        :meter_id,
        :organization_id,
        :page,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :customer_meters_list},
      url: "/v1/customer-meters/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerMeter, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Customer

  Create a customer.

  **Scopes**: `customers:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customers_create(
          body :: Polarex.CustomerIndividualCreate.t() | Polarex.CustomerTeamCreate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customers_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Mcp, :customers_create},
      url: "/v1/customers/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{Polarex.CustomerIndividualCreate, :t}, {Polarex.CustomerTeamCreate, :t}]}}
      ],
      response: [
        {201, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Customer

  Delete a customer.

  This action cannot be undone and will immediately:
  - Cancel any active subscriptions for the customer
  - Revoke all their benefits
  - Clear any `external_id`

  Use it only in the context of deleting a user within your
  own service. Otherwise, use more granular API endpoints to cancel
  a specific subscription or revoke certain benefits.

  Note: The customers information will nonetheless be retained for historic
  orders and subscriptions.

  Set `anonymize=true` to also anonymize PII for GDPR compliance.

  **Scopes**: `customers:write`

  ## Options

    * `anonymize`: If true, also anonymize the customer's personal data for GDPR compliance. This replaces email with a hashed version, hashes name and billing name (name preserved for businesses with tax_id), clears billing address, and removes OAuth account data.

  """
  @spec customers_delete(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_delete(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:anonymize])

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customers_delete},
      url: "/v1/customers/#{id}",
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
  Delete Customer by External ID

  Delete a customer by external ID.

  Immediately cancels any active subscriptions and revokes any active benefits.

  Set `anonymize=true` to also anonymize PII for GDPR compliance.

  **Scopes**: `customers:write`

  ## Options

    * `anonymize`: If true, also anonymize the customer's personal data for GDPR compliance.

  """
  @spec customers_delete_external(external_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_delete_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:anonymize])

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Mcp, :customers_delete_external},
      url: "/v1/customers/external/#{external_id}",
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
  Export Customers

  Export customers as a CSV file.

  **Scopes**: `customers:read` `customers:write`

  ## Options

    * `organization_id`: Filter by organization ID.

  """
  @spec customers_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customers_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :customers_export},
      url: "/v1/customers/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Customer

  Get a customer by ID.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customers_get},
      url: "/v1/customers/#{id}",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer by External ID

  Get a customer by external ID.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get_external(external_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Mcp, :customers_get_external},
      url: "/v1/customers/external/#{external_id}",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer State

  Get a customer state by ID.

  The customer state includes information about
  the customer's active subscriptions and benefits.

  It's the ideal endpoint to use when you need to get a full overview
  of a customer's status.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get_state(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerStateIndividual.t() | Polarex.CustomerStateTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_state(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :customers_get_state},
      url: "/v1/customers/#{id}/state",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerStateIndividual, :t}, {Polarex.CustomerStateTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Customer State by External ID

  Get a customer state by external ID.

  The customer state includes information about
  the customer's active subscriptions and benefits.

  It's the ideal endpoint to use when you need to get a full overview
  of a customer's status.

  **Scopes**: `customers:read` `customers:write`
  """
  @spec customers_get_state_external(external_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerStateIndividual.t() | Polarex.CustomerStateTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_get_state_external(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Polarex.Mcp, :customers_get_state_external},
      url: "/v1/customers/external/#{external_id}/state",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CustomerStateIndividual, :t}, {Polarex.CustomerStateTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Customers

  List customers.

  **Scopes**: `customers:read` `customers:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `email`: Filter by exact email.
    * `query`: Filter by name, email, or external ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec customers_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomer.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customers_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:email, :limit, :metadata, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :customers_list},
      url: "/v1/customers/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomer, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer

  Update a customer.

  **Scopes**: `customers:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customers_update(id :: String.t(), body :: Polarex.CustomerUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :customers_update},
      url: "/v1/customers/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerUpdate, :t}}],
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Customer by External ID

  Update a customer by external ID.

  **Scopes**: `customers:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customers_update_external(
          external_id :: String.t(),
          body :: Polarex.CustomerUpdateExternalID.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customers_update_external(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Polarex.Mcp, :customers_update_external},
      url: "/v1/customers/external/#{external_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.CustomerUpdateExternalID, :t}}],
      response: [
        {200, {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
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
      call: {Polarex.Mcp, :members_create_member},
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
      call: {Polarex.Mcp, :members_delete_member},
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
      call: {Polarex.Mcp, :members_delete_member_by_external_id},
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
      call: {Polarex.Mcp, :members_get_member},
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
      call: {Polarex.Mcp, :members_get_member_by_external_id},
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
      call: {Polarex.Mcp, :members_list_members},
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
      call: {Polarex.Mcp, :members_update_member},
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
      call: {Polarex.Mcp, :members_update_member_by_external_id},
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

  @doc """
  Create Metric Dashboard

  Create a user-defined metric dashboard.

  **Scopes**: `metrics:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec metrics_create_dashboard(body :: Polarex.MetricDashboardCreate.t(), opts :: keyword) ::
          {:ok, Polarex.MetricDashboardSchema.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_create_dashboard(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Mcp, :metrics_create_dashboard},
      url: "/v1/metrics/dashboards",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.MetricDashboardCreate, :t}}],
      response: [
        {201, {Polarex.MetricDashboardSchema, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Metric Dashboard

  Delete a user-defined metric dashboard.

  **Scopes**: `metrics:write`
  """
  @spec metrics_delete_dashboard(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def metrics_delete_dashboard(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :metrics_delete_dashboard},
      url: "/v1/metrics/dashboards/#{id}",
      method: :delete,
      response: [{204, :null}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Export Metrics

  Export metrics as a CSV file.

  **Scopes**: `metrics:read`

  ## Options

    * `start_date`: Start date.
    * `end_date`: End date.
    * `timezone`: Timezone to use for the timestamps. Default is UTC.
    * `interval`: Interval between two timestamps.
    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `billing_type`: Filter by billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `customer_id`: Filter by customer ID.
    * `metrics`: List of metric slugs to include in the export. If not provided, all metrics are exported.

  """
  @spec metrics_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_export(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billing_type,
        :customer_id,
        :end_date,
        :interval,
        :metrics,
        :organization_id,
        :product_id,
        :start_date,
        :timezone
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :metrics_export},
      url: "/v1/metrics/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Metrics

  Get metrics about your orders and subscriptions.

  Currency values are output in cents.

  **Scopes**: `metrics:read`

  ## Options

    * `start_date`: Start date.
    * `end_date`: End date.
    * `timezone`: Timezone to use for the timestamps. Default is UTC.
    * `interval`: Interval between two timestamps.
    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `billing_type`: Filter by billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `customer_id`: Filter by customer ID.
    * `metrics`: List of metric slugs to focus on. When provided, only the queries needed for these metrics will be executed, improving performance. If not provided, all metrics are returned.

  """
  @spec metrics_get(opts :: keyword) ::
          {:ok, Polarex.MetricsResponse.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_get(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billing_type,
        :customer_id,
        :end_date,
        :interval,
        :metrics,
        :organization_id,
        :product_id,
        :start_date,
        :timezone
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :metrics_get},
      url: "/v1/metrics/",
      method: :get,
      query: query,
      response: [{200, {Polarex.MetricsResponse, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Metric Dashboard

  Get a user-defined metric dashboard by ID.

  **Scopes**: `metrics:read`
  """
  @spec metrics_get_dashboard(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.MetricDashboardSchema.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_get_dashboard(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :metrics_get_dashboard},
      url: "/v1/metrics/dashboards/#{id}",
      method: :get,
      response: [
        {200, {Polarex.MetricDashboardSchema, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Metrics Limits

  Get the interval limits for the metrics endpoint.

  **Scopes**: `metrics:read`
  """
  @spec metrics_limits(opts :: keyword) :: {:ok, Polarex.MetricsLimits.t()} | :error
  def metrics_limits(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :metrics_limits},
      url: "/v1/metrics/limits",
      method: :get,
      response: [{200, {Polarex.MetricsLimits, :t}}],
      opts: opts
    })
  end

  @doc """
  List Metric Dashboards

  List user-defined metric dashboards.

  **Scopes**: `metrics:read`

  ## Options

    * `organization_id`: Filter by organization ID.

  """
  @spec metrics_list_dashboards(opts :: keyword) ::
          {:ok, [Polarex.MetricDashboardSchema.t()]} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_list_dashboards(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :metrics_list_dashboards},
      url: "/v1/metrics/dashboards",
      method: :get,
      query: query,
      response: [
        {200, [{Polarex.MetricDashboardSchema, :t}]},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Metric Dashboard

  Update a user-defined metric dashboard.

  **Scopes**: `metrics:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec metrics_update_dashboard(
          id :: String.t(),
          body :: Polarex.MetricDashboardUpdate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.MetricDashboardSchema.t()} | {:error, Polarex.HTTPValidationError.t()}
  def metrics_update_dashboard(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :metrics_update_dashboard},
      url: "/v1/metrics/dashboards/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.MetricDashboardUpdate, :t}}],
      response: [
        {200, {Polarex.MetricDashboardSchema, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Export Orders

  Export orders as a CSV file.

  **Scopes**: `orders:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.

  """
  @spec orders_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def orders_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id, :product_id])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :orders_export},
      url: "/v1/orders/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Generate Order Invoice

  Trigger generation of an order's invoice.

  **Scopes**: `orders:read`
  """
  @spec orders_generate_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, map}
          | {:error, Polarex.MissingInvoiceBillingDetails.t() | Polarex.NotPaidOrder.t()}
  def orders_generate_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :orders_generate_invoice},
      url: "/v1/orders/#{id}/invoice",
      method: :post,
      response: [
        {202, :map},
        {422, {:union, [{Polarex.MissingInvoiceBillingDetails, :t}, {Polarex.NotPaidOrder, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order

  Get an order by ID.

  **Scopes**: `orders:read`
  """
  @spec orders_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Order.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :orders_get},
      url: "/v1/orders/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Order, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Order Invoice

  Get an order's invoice data.

  **Scopes**: `orders:read`
  """
  @spec orders_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.OrderInvoice.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :orders_invoice},
      url: "/v1/orders/#{id}/invoice",
      method: :get,
      response: [
        {200, {Polarex.OrderInvoice, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Orders

  List orders.

  **Scopes**: `orders:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `product_billing_type`: Filter by product billing type. `recurring` will filter data corresponding to subscriptions creations or renewals. `one_time` will filter data corresponding to one-time purchases.
    * `discount_id`: Filter by discount ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `checkout_id`: Filter by checkout ID.
    * `subscription_id`: Filter by subscription ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec orders_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceOrder.t()} | {:error, Polarex.HTTPValidationError.t()}
  def orders_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :checkout_id,
        :customer_id,
        :discount_id,
        :external_customer_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_billing_type,
        :product_id,
        :sorting,
        :subscription_id
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :orders_list},
      url: "/v1/orders/",
      method: :get,
      query: query,
      response: [{200, {Polarex.ListResourceOrder, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Order Receipt

  Get a presigned URL to download an order's receipt PDF.

  **Scopes**: `orders:read`
  """
  @spec orders_receipt(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.OrderReceipt.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_receipt(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :orders_receipt},
      url: "/v1/orders/#{id}/receipt",
      method: :get,
      response: [
        {200, {Polarex.OrderReceipt, :t}},
        {202, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Order

  Update an order.

  **Scopes**: `orders:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec orders_update(id :: String.t(), body :: Polarex.OrderUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Order.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def orders_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :orders_update},
      url: "/v1/orders/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.OrderUpdate, :t}}],
      response: [
        {200, {Polarex.Order, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

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
      call: {Polarex.Mcp, :organization_access_tokens_create},
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
      call: {Polarex.Mcp, :organization_access_tokens_delete},
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
      call: {Polarex.Mcp, :organization_access_tokens_list},
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
      call: {Polarex.Mcp, :organization_access_tokens_update},
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

  @doc """
  Get Payment

  Get a payment by ID.

  **Scopes**: `payments:read`
  """
  @spec payments_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CardPayment.t() | Polarex.GenericPayment.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def payments_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :payments_get},
      url: "/v1/payments/#{id}",
      method: :get,
      response: [
        {200, {:union, [{Polarex.CardPayment, :t}, {Polarex.GenericPayment, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Payments

  List payments.

  **Scopes**: `payments:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `checkout_id`: Filter by checkout ID.
    * `order_id`: Filter by order ID.
    * `status`: Filter by payment status.
    * `method`: Filter by payment method.
    * `customer_email`: Filter by customer email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec payments_list(opts :: keyword) ::
          {:ok, Polarex.ListResourcePayment.t()} | {:error, Polarex.HTTPValidationError.t()}
  def payments_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :checkout_id,
        :customer_email,
        :limit,
        :method,
        :order_id,
        :organization_id,
        :page,
        :sorting,
        :status
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :payments_list},
      url: "/v1/payments/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourcePayment, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Product

  Create a product.

  **Scopes**: `products:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec products_create(
          body :: Polarex.ProductCreateOneTime.t() | Polarex.ProductCreateRecurring.t(),
          opts :: keyword
        ) :: {:ok, Polarex.Product.t()} | {:error, Polarex.HTTPValidationError.t()}
  def products_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Mcp, :products_create},
      url: "/v1/products/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{Polarex.ProductCreateOneTime, :t}, {Polarex.ProductCreateRecurring, :t}]}}
      ],
      response: [{201, {Polarex.Product, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Product

  Get a product by ID.

  **Scopes**: `products:read` `products:write`
  """
  @spec products_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def products_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :products_get},
      url: "/v1/products/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Product, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Products

  List products.

  **Scopes**: `products:read` `products:write`

  ## Options

    * `id`: Filter by product ID.
    * `organization_id`: Filter by organization ID.
    * `query`: Filter by product name.
    * `is_archived`: Filter on archived products.
    * `is_recurring`: Filter on recurring products. If `true`, only subscriptions tiers are returned. If `false`, only one-time purchase products are returned. 
    * `benefit_id`: Filter products granting specific benefit.
    * `visibility`: Filter by visibility.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec products_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceProduct.t()} | {:error, Polarex.HTTPValidationError.t()}
  def products_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :benefit_id,
        :id,
        :is_archived,
        :is_recurring,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :query,
        :sorting,
        :visibility
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :products_list},
      url: "/v1/products/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceProduct, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product

  Update a product.

  **Scopes**: `products:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec products_update(id :: String.t(), body :: Polarex.ProductUpdate.t(), opts :: keyword) ::
          {:ok, Polarex.Product.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def products_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :products_update},
      url: "/v1/products/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.ProductUpdate, :t}}],
      response: [
        {200, {Polarex.Product, :t}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product Benefits

  Update benefits granted by a product.

  **Scopes**: `products:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec products_update_benefits(
          id :: String.t(),
          body :: Polarex.ProductBenefitsUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Product.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def products_update_benefits(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :products_update_benefits},
      url: "/v1/products/#{id}/benefits",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.ProductBenefitsUpdate, :t}}],
      response: [
        {200, {Polarex.Product, :t}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Subscription

  Create a subscription programmatically.

  This endpoint only allows to create subscription on free products.
  For paid products, use the checkout flow.

  No initial order will be created and no confirmation email will be sent.

  **Scopes**: `subscriptions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec subscriptions_create(
          body ::
            Polarex.SubscriptionCreateCustomer.t()
            | Polarex.SubscriptionCreateExternalCustomer.t(),
          opts :: keyword
        ) :: {:ok, Polarex.Subscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Mcp, :subscriptions_create},
      url: "/v1/subscriptions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCreateCustomer, :t},
            {Polarex.SubscriptionCreateExternalCustomer, :t}
          ]}}
      ],
      response: [{201, {Polarex.Subscription, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Export Subscriptions

  Export subscriptions as a CSV file.

  **Scopes**: `subscriptions:read` `subscriptions:write`

  ## Options

    * `organization_id`: Filter by organization ID.

  """
  @spec subscriptions_export(opts :: keyword) ::
          {:ok, map | String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_export(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization_id])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :subscriptions_export},
      url: "/v1/subscriptions/export",
      method: :get,
      query: query,
      response: [{200, {:union, [:map, :string]}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription by ID.

  **Scopes**: `subscriptions:read` `subscriptions:write`
  """
  @spec subscriptions_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :subscriptions_get},
      url: "/v1/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Subscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Subscriptions

  List subscriptions.

  **Scopes**: `subscriptions:read` `subscriptions:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `discount_id`: Filter by discount ID.
    * `active`: Filter by active or inactive subscription.
    * `cancel_at_period_end`: Filter by subscriptions that are set to cancel at period end.
    * `customer_cancellation_reason`: Filter by customer cancellation reason.
    * `canceled_at_after`: Filter by cancellation date (after or equal to).
    * `canceled_at_before`: Filter by cancellation date (before or equal to).
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec subscriptions_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceSubscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :active,
        :cancel_at_period_end,
        :canceled_at_after,
        :canceled_at_before,
        :customer_cancellation_reason,
        :customer_id,
        :discount_id,
        :external_customer_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_id,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Mcp, :subscriptions_list},
      url: "/v1/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceSubscription, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Revoke Subscription

  Revoke a subscription, i.e cancel immediately.

  **Scopes**: `subscriptions:write`
  """
  @spec subscriptions_revoke(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.SubscriptionLocked.t()}
  def subscriptions_revoke(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Mcp, :subscriptions_revoke},
      url: "/v1/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.Subscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.SubscriptionLocked, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Subscription

  Update a subscription.

  **Scopes**: `subscriptions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec subscriptions_update(
          id :: String.t(),
          body ::
            Polarex.SubscriptionCancel.t()
            | Polarex.SubscriptionRevoke.t()
            | Polarex.SubscriptionUpdateBillingPeriod.t()
            | Polarex.SubscriptionUpdateClear.t()
            | Polarex.SubscriptionUpdateDiscount.t()
            | Polarex.SubscriptionUpdateProduct.t()
            | Polarex.SubscriptionUpdateSeats.t()
            | Polarex.SubscriptionUpdateTrial.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.PaymentFailed.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.SubscriptionLocked.t()}
  def subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Mcp, :subscriptions_update},
      url: "/v1/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCancel, :t},
            {Polarex.SubscriptionRevoke, :t},
            {Polarex.SubscriptionUpdateBillingPeriod, :t},
            {Polarex.SubscriptionUpdateClear, :t},
            {Polarex.SubscriptionUpdateDiscount, :t},
            {Polarex.SubscriptionUpdateProduct, :t},
            {Polarex.SubscriptionUpdateSeats, :t},
            {Polarex.SubscriptionUpdateTrial, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.Subscription, :t}},
        {402, {Polarex.PaymentFailed, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.SubscriptionLocked, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

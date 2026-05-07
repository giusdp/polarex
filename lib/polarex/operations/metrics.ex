defmodule Polarex.Metrics do
  @moduledoc """
  Provides API endpoints related to metrics
  """

  @default_client Polarex.Support.Client

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
      call: {Polarex.Metrics, :metrics_create_dashboard},
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
      call: {Polarex.Metrics, :metrics_delete_dashboard},
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
      call: {Polarex.Metrics, :metrics_export},
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
      call: {Polarex.Metrics, :metrics_get},
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
      call: {Polarex.Metrics, :metrics_get_dashboard},
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
      call: {Polarex.Metrics, :metrics_limits},
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
      call: {Polarex.Metrics, :metrics_list_dashboards},
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
      call: {Polarex.Metrics, :metrics_update_dashboard},
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

  @type t :: %__MODULE__{
          active_subscriptions: Polarex.Metric.t() | nil,
          active_user_by_event: Polarex.Metric.t() | nil,
          annual_recurring_revenue: Polarex.Metric.t() | nil,
          average_order_value: Polarex.Metric.t() | nil,
          average_revenue_per_user: Polarex.Metric.t() | nil,
          average_seats_per_customer: Polarex.Metric.t() | nil,
          canceled_subscriptions: Polarex.Metric.t() | nil,
          canceled_subscriptions_customer_service: Polarex.Metric.t() | nil,
          canceled_subscriptions_low_quality: Polarex.Metric.t() | nil,
          canceled_subscriptions_missing_features: Polarex.Metric.t() | nil,
          canceled_subscriptions_other: Polarex.Metric.t() | nil,
          canceled_subscriptions_switched_service: Polarex.Metric.t() | nil,
          canceled_subscriptions_too_complex: Polarex.Metric.t() | nil,
          canceled_subscriptions_too_expensive: Polarex.Metric.t() | nil,
          canceled_subscriptions_unused: Polarex.Metric.t() | nil,
          cashflow: Polarex.Metric.t() | nil,
          checkouts: Polarex.Metric.t() | nil,
          checkouts_conversion: Polarex.Metric.t() | nil,
          churn_rate: Polarex.Metric.t() | nil,
          churned_seat_customers: Polarex.Metric.t() | nil,
          churned_subscriptions: Polarex.Metric.t() | nil,
          committed_annual_recurring_revenue: Polarex.Metric.t() | nil,
          committed_monthly_recurring_revenue: Polarex.Metric.t() | nil,
          committed_subscriptions: Polarex.Metric.t() | nil,
          cost_per_user: Polarex.Metric.t() | nil,
          costs: Polarex.Metric.t() | nil,
          cumulative_costs: Polarex.Metric.t() | nil,
          cumulative_revenue: Polarex.Metric.t() | nil,
          gross_margin: Polarex.Metric.t() | nil,
          gross_margin_percentage: Polarex.Metric.t() | nil,
          ltv: Polarex.Metric.t() | nil,
          monthly_recurring_revenue: Polarex.Metric.t() | nil,
          net_average_order_value: Polarex.Metric.t() | nil,
          net_cumulative_revenue: Polarex.Metric.t() | nil,
          net_revenue: Polarex.Metric.t() | nil,
          new_seat_customers: Polarex.Metric.t() | nil,
          new_subscriptions: Polarex.Metric.t() | nil,
          new_subscriptions_net_revenue: Polarex.Metric.t() | nil,
          new_subscriptions_revenue: Polarex.Metric.t() | nil,
          one_time_products: Polarex.Metric.t() | nil,
          one_time_products_net_revenue: Polarex.Metric.t() | nil,
          one_time_products_revenue: Polarex.Metric.t() | nil,
          orders: Polarex.Metric.t() | nil,
          renewed_subscriptions: Polarex.Metric.t() | nil,
          renewed_subscriptions_net_revenue: Polarex.Metric.t() | nil,
          renewed_subscriptions_revenue: Polarex.Metric.t() | nil,
          revenue: Polarex.Metric.t() | nil,
          seat_customers: Polarex.Metric.t() | nil,
          seat_utilization_rate: Polarex.Metric.t() | nil,
          seats_claimed: Polarex.Metric.t() | nil,
          seats_pending: Polarex.Metric.t() | nil,
          seats_total: Polarex.Metric.t() | nil,
          succeeded_checkouts: Polarex.Metric.t() | nil,
          trial_committed_monthly_recurring_revenue: Polarex.Metric.t() | nil,
          trial_monthly_recurring_revenue: Polarex.Metric.t() | nil
        }

  defstruct [
    :active_subscriptions,
    :active_user_by_event,
    :annual_recurring_revenue,
    :average_order_value,
    :average_revenue_per_user,
    :average_seats_per_customer,
    :canceled_subscriptions,
    :canceled_subscriptions_customer_service,
    :canceled_subscriptions_low_quality,
    :canceled_subscriptions_missing_features,
    :canceled_subscriptions_other,
    :canceled_subscriptions_switched_service,
    :canceled_subscriptions_too_complex,
    :canceled_subscriptions_too_expensive,
    :canceled_subscriptions_unused,
    :cashflow,
    :checkouts,
    :checkouts_conversion,
    :churn_rate,
    :churned_seat_customers,
    :churned_subscriptions,
    :committed_annual_recurring_revenue,
    :committed_monthly_recurring_revenue,
    :committed_subscriptions,
    :cost_per_user,
    :costs,
    :cumulative_costs,
    :cumulative_revenue,
    :gross_margin,
    :gross_margin_percentage,
    :ltv,
    :monthly_recurring_revenue,
    :net_average_order_value,
    :net_cumulative_revenue,
    :net_revenue,
    :new_seat_customers,
    :new_subscriptions,
    :new_subscriptions_net_revenue,
    :new_subscriptions_revenue,
    :one_time_products,
    :one_time_products_net_revenue,
    :one_time_products_revenue,
    :orders,
    :renewed_subscriptions,
    :renewed_subscriptions_net_revenue,
    :renewed_subscriptions_revenue,
    :revenue,
    :seat_customers,
    :seat_utilization_rate,
    :seats_claimed,
    :seats_pending,
    :seats_total,
    :succeeded_checkouts,
    :trial_committed_monthly_recurring_revenue,
    :trial_monthly_recurring_revenue
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      active_user_by_event: {:union, [{Polarex.Metric, :t}, :null]},
      annual_recurring_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      average_order_value: {:union, [{Polarex.Metric, :t}, :null]},
      average_revenue_per_user: {:union, [{Polarex.Metric, :t}, :null]},
      average_seats_per_customer: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_customer_service: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_low_quality: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_missing_features: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_other: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_switched_service: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_too_complex: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_too_expensive: {:union, [{Polarex.Metric, :t}, :null]},
      canceled_subscriptions_unused: {:union, [{Polarex.Metric, :t}, :null]},
      cashflow: {:union, [{Polarex.Metric, :t}, :null]},
      checkouts: {:union, [{Polarex.Metric, :t}, :null]},
      checkouts_conversion: {:union, [{Polarex.Metric, :t}, :null]},
      churn_rate: {:union, [{Polarex.Metric, :t}, :null]},
      churned_seat_customers: {:union, [{Polarex.Metric, :t}, :null]},
      churned_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      committed_annual_recurring_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      committed_monthly_recurring_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      committed_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      cost_per_user: {:union, [{Polarex.Metric, :t}, :null]},
      costs: {:union, [{Polarex.Metric, :t}, :null]},
      cumulative_costs: {:union, [{Polarex.Metric, :t}, :null]},
      cumulative_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      gross_margin: {:union, [{Polarex.Metric, :t}, :null]},
      gross_margin_percentage: {:union, [{Polarex.Metric, :t}, :null]},
      ltv: {:union, [{Polarex.Metric, :t}, :null]},
      monthly_recurring_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      net_average_order_value: {:union, [{Polarex.Metric, :t}, :null]},
      net_cumulative_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      net_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      new_seat_customers: {:union, [{Polarex.Metric, :t}, :null]},
      new_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      new_subscriptions_net_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      new_subscriptions_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      one_time_products: {:union, [{Polarex.Metric, :t}, :null]},
      one_time_products_net_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      one_time_products_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      orders: {:union, [{Polarex.Metric, :t}, :null]},
      renewed_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      renewed_subscriptions_net_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      renewed_subscriptions_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      revenue: {:union, [{Polarex.Metric, :t}, :null]},
      seat_customers: {:union, [{Polarex.Metric, :t}, :null]},
      seat_utilization_rate: {:union, [{Polarex.Metric, :t}, :null]},
      seats_claimed: {:union, [{Polarex.Metric, :t}, :null]},
      seats_pending: {:union, [{Polarex.Metric, :t}, :null]},
      seats_total: {:union, [{Polarex.Metric, :t}, :null]},
      succeeded_checkouts: {:union, [{Polarex.Metric, :t}, :null]},
      trial_committed_monthly_recurring_revenue: {:union, [{Polarex.Metric, :t}, :null]},
      trial_monthly_recurring_revenue: {:union, [{Polarex.Metric, :t}, :null]}
    ]
  end
end

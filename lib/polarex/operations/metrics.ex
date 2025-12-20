defmodule Polarex.Metrics do
  @moduledoc """
  Provides API endpoints related to metrics
  """

  @default_client Polarex.Support.Client

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
  @spec metrics_get(keyword) ::
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
  Get Metrics Limits

  Get the interval limits for the metrics endpoint.

  **Scopes**: `metrics:read`
  """
  @spec metrics_limits(keyword) :: {:ok, Polarex.MetricsLimits.t()} | :error
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

  @type t :: %__MODULE__{
          active_subscriptions: Polarex.Metric.t() | nil,
          active_user_by_event: Polarex.Metric.t() | nil,
          average_order_value: Polarex.Metric.t() | nil,
          average_revenue_per_user: Polarex.Metric.t() | nil,
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
          churned_subscriptions: Polarex.Metric.t() | nil,
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
          succeeded_checkouts: Polarex.Metric.t() | nil
        }

  defstruct [
    :active_subscriptions,
    :active_user_by_event,
    :average_order_value,
    :average_revenue_per_user,
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
    :churned_subscriptions,
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
    :succeeded_checkouts
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
      active_user_by_event: {:union, [{Polarex.Metric, :t}, :null]},
      average_order_value: {:union, [{Polarex.Metric, :t}, :null]},
      average_revenue_per_user: {:union, [{Polarex.Metric, :t}, :null]},
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
      churned_subscriptions: {:union, [{Polarex.Metric, :t}, :null]},
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
      succeeded_checkouts: {:union, [{Polarex.Metric, :t}, :null]}
    ]
  end
end

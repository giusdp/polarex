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
          active_subscriptions: Polarex.Metric.t(),
          active_user_by_event: Polarex.Metric.t(),
          average_order_value: Polarex.Metric.t(),
          average_revenue_per_user: Polarex.Metric.t(),
          canceled_subscriptions: Polarex.Metric.t(),
          canceled_subscriptions_customer_service: Polarex.Metric.t(),
          canceled_subscriptions_low_quality: Polarex.Metric.t(),
          canceled_subscriptions_missing_features: Polarex.Metric.t(),
          canceled_subscriptions_other: Polarex.Metric.t(),
          canceled_subscriptions_switched_service: Polarex.Metric.t(),
          canceled_subscriptions_too_complex: Polarex.Metric.t(),
          canceled_subscriptions_too_expensive: Polarex.Metric.t(),
          canceled_subscriptions_unused: Polarex.Metric.t(),
          cashflow: Polarex.Metric.t(),
          checkouts: Polarex.Metric.t(),
          checkouts_conversion: Polarex.Metric.t(),
          churn_rate: Polarex.Metric.t(),
          committed_monthly_recurring_revenue: Polarex.Metric.t(),
          cost_per_user: Polarex.Metric.t(),
          costs: Polarex.Metric.t(),
          cumulative_costs: Polarex.Metric.t(),
          cumulative_revenue: Polarex.Metric.t(),
          gross_margin: Polarex.Metric.t(),
          gross_margin_percentage: Polarex.Metric.t(),
          monthly_recurring_revenue: Polarex.Metric.t(),
          net_average_order_value: Polarex.Metric.t(),
          net_cumulative_revenue: Polarex.Metric.t(),
          net_revenue: Polarex.Metric.t(),
          new_subscriptions: Polarex.Metric.t(),
          new_subscriptions_net_revenue: Polarex.Metric.t(),
          new_subscriptions_revenue: Polarex.Metric.t(),
          one_time_products: Polarex.Metric.t(),
          one_time_products_net_revenue: Polarex.Metric.t(),
          one_time_products_revenue: Polarex.Metric.t(),
          orders: Polarex.Metric.t(),
          renewed_subscriptions: Polarex.Metric.t(),
          renewed_subscriptions_net_revenue: Polarex.Metric.t(),
          renewed_subscriptions_revenue: Polarex.Metric.t(),
          revenue: Polarex.Metric.t(),
          succeeded_checkouts: Polarex.Metric.t()
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
    :committed_monthly_recurring_revenue,
    :cost_per_user,
    :costs,
    :cumulative_costs,
    :cumulative_revenue,
    :gross_margin,
    :gross_margin_percentage,
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
      active_subscriptions: {Polarex.Metric, :t},
      active_user_by_event: {Polarex.Metric, :t},
      average_order_value: {Polarex.Metric, :t},
      average_revenue_per_user: {Polarex.Metric, :t},
      canceled_subscriptions: {Polarex.Metric, :t},
      canceled_subscriptions_customer_service: {Polarex.Metric, :t},
      canceled_subscriptions_low_quality: {Polarex.Metric, :t},
      canceled_subscriptions_missing_features: {Polarex.Metric, :t},
      canceled_subscriptions_other: {Polarex.Metric, :t},
      canceled_subscriptions_switched_service: {Polarex.Metric, :t},
      canceled_subscriptions_too_complex: {Polarex.Metric, :t},
      canceled_subscriptions_too_expensive: {Polarex.Metric, :t},
      canceled_subscriptions_unused: {Polarex.Metric, :t},
      cashflow: {Polarex.Metric, :t},
      checkouts: {Polarex.Metric, :t},
      checkouts_conversion: {Polarex.Metric, :t},
      churn_rate: {Polarex.Metric, :t},
      committed_monthly_recurring_revenue: {Polarex.Metric, :t},
      cost_per_user: {Polarex.Metric, :t},
      costs: {Polarex.Metric, :t},
      cumulative_costs: {Polarex.Metric, :t},
      cumulative_revenue: {Polarex.Metric, :t},
      gross_margin: {Polarex.Metric, :t},
      gross_margin_percentage: {Polarex.Metric, :t},
      monthly_recurring_revenue: {Polarex.Metric, :t},
      net_average_order_value: {Polarex.Metric, :t},
      net_cumulative_revenue: {Polarex.Metric, :t},
      net_revenue: {Polarex.Metric, :t},
      new_subscriptions: {Polarex.Metric, :t},
      new_subscriptions_net_revenue: {Polarex.Metric, :t},
      new_subscriptions_revenue: {Polarex.Metric, :t},
      one_time_products: {Polarex.Metric, :t},
      one_time_products_net_revenue: {Polarex.Metric, :t},
      one_time_products_revenue: {Polarex.Metric, :t},
      orders: {Polarex.Metric, :t},
      renewed_subscriptions: {Polarex.Metric, :t},
      renewed_subscriptions_net_revenue: {Polarex.Metric, :t},
      renewed_subscriptions_revenue: {Polarex.Metric, :t},
      revenue: {Polarex.Metric, :t},
      succeeded_checkouts: {Polarex.Metric, :t}
    ]
  end
end

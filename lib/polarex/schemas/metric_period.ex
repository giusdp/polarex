defmodule Polarex.MetricPeriod do
  @moduledoc """
  Provides struct and type for a MetricPeriod
  """

  @type t :: %__MODULE__{
          active_subscriptions: integer | number,
          average_order_value: integer | number,
          checkouts: integer | number,
          checkouts_conversion: integer | number,
          cumulative_revenue: integer | number,
          monthly_recurring_revenue: integer | number,
          new_subscriptions: integer | number,
          new_subscriptions_revenue: integer | number,
          one_time_products: integer | number,
          one_time_products_revenue: integer | number,
          orders: integer | number,
          renewed_subscriptions: integer | number,
          renewed_subscriptions_revenue: integer | number,
          revenue: integer | number,
          succeeded_checkouts: integer | number,
          timestamp: DateTime.t()
        }

  defstruct [
    :active_subscriptions,
    :average_order_value,
    :checkouts,
    :checkouts_conversion,
    :cumulative_revenue,
    :monthly_recurring_revenue,
    :new_subscriptions,
    :new_subscriptions_revenue,
    :one_time_products,
    :one_time_products_revenue,
    :orders,
    :renewed_subscriptions,
    :renewed_subscriptions_revenue,
    :revenue,
    :succeeded_checkouts,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_subscriptions: {:union, [:integer, :number]},
      average_order_value: {:union, [:integer, :number]},
      checkouts: {:union, [:integer, :number]},
      checkouts_conversion: {:union, [:integer, :number]},
      cumulative_revenue: {:union, [:integer, :number]},
      monthly_recurring_revenue: {:union, [:integer, :number]},
      new_subscriptions: {:union, [:integer, :number]},
      new_subscriptions_revenue: {:union, [:integer, :number]},
      one_time_products: {:union, [:integer, :number]},
      one_time_products_revenue: {:union, [:integer, :number]},
      orders: {:union, [:integer, :number]},
      renewed_subscriptions: {:union, [:integer, :number]},
      renewed_subscriptions_revenue: {:union, [:integer, :number]},
      revenue: {:union, [:integer, :number]},
      succeeded_checkouts: {:union, [:integer, :number]},
      timestamp: {:string, :date_time}
    ]
  end
end

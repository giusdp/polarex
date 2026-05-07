defmodule Polarex.Subscription do
  @moduledoc """
  Provides struct and type for a Subscription
  """

  @type t :: %__MODULE__{
          amount: integer,
          cancel_at_period_end: boolean,
          canceled_at: DateTime.t() | nil,
          checkout_id: String.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          current_period_end: DateTime.t(),
          current_period_start: DateTime.t(),
          custom_field_data: map | nil,
          customer: Polarex.SubscriptionCustomer.t(),
          customer_cancellation_comment: String.t() | nil,
          customer_cancellation_reason: String.t() | nil,
          customer_id: String.t(),
          discount: map | nil,
          discount_id: String.t() | nil,
          ended_at: DateTime.t() | nil,
          ends_at: DateTime.t() | nil,
          id: String.t(),
          metadata: map,
          meters: [Polarex.SubscriptionMeter.t()],
          modified_at: DateTime.t() | nil,
          pending_update: Polarex.PendingSubscriptionUpdate.t() | nil,
          prices: [map],
          product: Polarex.Product.t(),
          product_id: String.t(),
          recurring_interval: String.t(),
          recurring_interval_count: integer,
          seats: integer | nil,
          started_at: DateTime.t() | nil,
          status: String.t(),
          trial_end: DateTime.t() | nil,
          trial_start: DateTime.t() | nil
        }

  defstruct [
    :amount,
    :cancel_at_period_end,
    :canceled_at,
    :checkout_id,
    :created_at,
    :currency,
    :current_period_end,
    :current_period_start,
    :custom_field_data,
    :customer,
    :customer_cancellation_comment,
    :customer_cancellation_reason,
    :customer_id,
    :discount,
    :discount_id,
    :ended_at,
    :ends_at,
    :id,
    :metadata,
    :meters,
    :modified_at,
    :pending_update,
    :prices,
    :product,
    :product_id,
    :recurring_interval,
    :recurring_interval_count,
    :seats,
    :started_at,
    :status,
    :trial_end,
    :trial_start
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      cancel_at_period_end: :boolean,
      canceled_at: {:union, [{:string, "date-time"}, :null]},
      checkout_id: {:union, [{:string, "uuid4"}, :null]},
      created_at: {:string, "date-time"},
      currency: :string,
      current_period_end: {:string, "date-time"},
      current_period_start: {:string, "date-time"},
      custom_field_data: :map,
      customer: {Polarex.SubscriptionCustomer, :t},
      customer_cancellation_comment: {:union, [:string, :null]},
      customer_cancellation_reason:
        {:union,
         [
           {:enum,
            [
              "customer_service",
              "low_quality",
              "missing_features",
              "switched_service",
              "too_complex",
              "too_expensive",
              "unused",
              "other"
            ]},
           :null
         ]},
      customer_id: {:string, "uuid4"},
      discount: {:union, [:map, :null]},
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      ended_at: {:union, [{:string, "date-time"}, :null]},
      ends_at: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      metadata: :map,
      meters: [{Polarex.SubscriptionMeter, :t}],
      modified_at: {:union, [{:string, "date-time"}, :null]},
      pending_update: {:union, [{Polarex.PendingSubscriptionUpdate, :t}, :null]},
      prices: [:map],
      product: {Polarex.Product, :t},
      product_id: {:string, "uuid4"},
      recurring_interval: {:enum, ["day", "week", "month", "year"]},
      recurring_interval_count: :integer,
      seats: {:union, [:integer, :null]},
      started_at: {:union, [{:string, "date-time"}, :null]},
      status:
        {:enum,
         [
           "incomplete",
           "incomplete_expired",
           "trialing",
           "active",
           "past_due",
           "canceled",
           "unpaid"
         ]},
      trial_end: {:union, [{:string, "date-time"}, :null]},
      trial_start: {:union, [{:string, "date-time"}, :null]}
    ]
  end
end

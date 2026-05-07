defmodule Polarex.OrderSubscription do
  @moduledoc """
  Provides struct and type for a OrderSubscription
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
          customer_cancellation_comment: String.t() | nil,
          customer_cancellation_reason: String.t() | nil,
          customer_id: String.t(),
          discount_id: String.t() | nil,
          ended_at: DateTime.t() | nil,
          ends_at: DateTime.t() | nil,
          id: String.t(),
          metadata: map,
          modified_at: DateTime.t() | nil,
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
    :customer_cancellation_comment,
    :customer_cancellation_reason,
    :customer_id,
    :discount_id,
    :ended_at,
    :ends_at,
    :id,
    :metadata,
    :modified_at,
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
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      ended_at: {:union, [{:string, "date-time"}, :null]},
      ends_at: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
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

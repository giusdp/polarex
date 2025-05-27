defmodule Polarex.Generated.Subscription do
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
          current_period_end: DateTime.t() | nil,
          current_period_start: DateTime.t(),
          custom_field_data: Polarex.Generated.CustomFieldData.t() | nil,
          customer: Polarex.Generated.SubscriptionCustomer.t(),
          customer_cancellation_comment: String.t() | nil,
          customer_cancellation_reason: String.t() | nil,
          customer_id: String.t(),
          discount: map | nil,
          discount_id: String.t() | nil,
          ended_at: DateTime.t() | nil,
          ends_at: DateTime.t() | nil,
          id: String.t(),
          metadata: Polarex.Generated.Metadata.t(),
          meters: [Polarex.Generated.SubscriptionMeter.t()],
          modified_at: DateTime.t() | nil,
          prices: [map],
          product: Polarex.Generated.Product.t(),
          product_id: String.t(),
          recurring_interval: String.t(),
          started_at: DateTime.t() | nil,
          status: String.t()
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
    :prices,
    :product,
    :product_id,
    :recurring_interval,
    :started_at,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      cancel_at_period_end: :boolean,
      canceled_at: {:union, [{:string, :date_time}, :null]},
      checkout_id: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      current_period_end: {:union, [{:string, :date_time}, :null]},
      current_period_start: {:string, :date_time},
      custom_field_data: {Polarex.Generated.CustomFieldData, :t},
      customer: {Polarex.Generated.SubscriptionCustomer, :t},
      customer_cancellation_comment: {:union, [{:string, :generic}, :null]},
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
      customer_id: {:string, :generic},
      discount: {:union, [:map, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      ended_at: {:union, [{:string, :date_time}, :null]},
      ends_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      metadata: {Polarex.Generated.Metadata, :t},
      meters: [{Polarex.Generated.SubscriptionMeter, :t}],
      modified_at: {:union, [{:string, :date_time}, :null]},
      prices: [:map],
      product: {Polarex.Generated.Product, :t},
      product_id: {:string, :generic},
      recurring_interval: {:enum, ["month", "year"]},
      started_at: {:union, [{:string, :date_time}, :null]},
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
         ]}
    ]
  end
end

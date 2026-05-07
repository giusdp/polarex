defmodule Polarex.CustomerStateSubscription do
  @moduledoc """
  Provides struct and type for a CustomerStateSubscription
  """

  @type t :: %__MODULE__{
          amount: integer,
          cancel_at_period_end: boolean,
          canceled_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          current_period_end: DateTime.t(),
          current_period_start: DateTime.t(),
          custom_field_data: map | nil,
          discount_id: String.t() | nil,
          ends_at: DateTime.t() | nil,
          id: String.t(),
          metadata: map,
          meters: [Polarex.CustomerStateSubscriptionMeter.t()],
          modified_at: DateTime.t() | nil,
          product_id: String.t(),
          recurring_interval: String.t(),
          started_at: DateTime.t() | nil,
          status: String.t(),
          trial_end: DateTime.t() | nil,
          trial_start: DateTime.t() | nil
        }

  defstruct [
    :amount,
    :cancel_at_period_end,
    :canceled_at,
    :created_at,
    :currency,
    :current_period_end,
    :current_period_start,
    :custom_field_data,
    :discount_id,
    :ends_at,
    :id,
    :metadata,
    :meters,
    :modified_at,
    :product_id,
    :recurring_interval,
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
      created_at: {:string, "date-time"},
      currency: :string,
      current_period_end: {:string, "date-time"},
      current_period_start: {:string, "date-time"},
      custom_field_data: :map,
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      ends_at: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      metadata: :map,
      meters: [{Polarex.CustomerStateSubscriptionMeter, :t}],
      modified_at: {:union, [{:string, "date-time"}, :null]},
      product_id: {:string, "uuid4"},
      recurring_interval: {:enum, ["day", "week", "month", "year"]},
      started_at: {:union, [{:string, "date-time"}, :null]},
      status: {:enum, ["active", "trialing"]},
      trial_end: {:union, [{:string, "date-time"}, :null]},
      trial_start: {:union, [{:string, "date-time"}, :null]}
    ]
  end
end

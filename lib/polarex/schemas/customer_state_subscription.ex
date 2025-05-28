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
          current_period_end: DateTime.t() | nil,
          current_period_start: DateTime.t(),
          custom_field_data: Polarex.CustomFieldData.t() | nil,
          discount_id: String.t() | nil,
          ends_at: DateTime.t() | nil,
          id: String.t(),
          metadata: Polarex.Metadata.t(),
          meters: [Polarex.CustomerStateSubscriptionMeter.t()],
          modified_at: DateTime.t() | nil,
          product_id: String.t(),
          recurring_interval: String.t(),
          started_at: DateTime.t() | nil,
          status: String.t()
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
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      current_period_end: {:union, [{:string, :date_time}, :null]},
      current_period_start: {:string, :date_time},
      custom_field_data: {Polarex.CustomFieldData, :t},
      discount_id: {:union, [{:string, :generic}, :null]},
      ends_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      meters: [{Polarex.CustomerStateSubscriptionMeter, :t}],
      modified_at: {:union, [{:string, :date_time}, :null]},
      product_id: {:string, :generic},
      recurring_interval: {:enum, ["month", "year"]},
      started_at: {:union, [{:string, :date_time}, :null]},
      status: {:const, "active"}
    ]
  end
end

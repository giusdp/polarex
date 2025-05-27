defmodule Polarex.Generated.SubscriptionCancel do
  @moduledoc """
  Provides struct and type for a SubscriptionCancel
  """

  @type t :: %__MODULE__{
          cancel_at_period_end: boolean,
          customer_cancellation_comment: String.t() | nil,
          customer_cancellation_reason: String.t() | nil
        }

  defstruct [:cancel_at_period_end, :customer_cancellation_comment, :customer_cancellation_reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cancel_at_period_end: :boolean,
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
         ]}
    ]
  end
end

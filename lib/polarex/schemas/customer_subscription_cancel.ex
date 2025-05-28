defmodule Polarex.CustomerSubscriptionCancel do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionCancel
  """

  @type t :: %__MODULE__{
          cancel_at_period_end: boolean | nil,
          cancellation_comment: String.t() | nil,
          cancellation_reason: String.t() | nil
        }

  defstruct [:cancel_at_period_end, :cancellation_comment, :cancellation_reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cancel_at_period_end: {:union, [:boolean, :null]},
      cancellation_comment: {:union, [{:string, :generic}, :null]},
      cancellation_reason:
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

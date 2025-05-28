defmodule Polarex.SubscriptionRevoke do
  @moduledoc """
  Provides struct and type for a SubscriptionRevoke
  """

  @type t :: %__MODULE__{
          customer_cancellation_comment: String.t() | nil,
          customer_cancellation_reason: String.t() | nil,
          revoke: true
        }

  defstruct [:customer_cancellation_comment, :customer_cancellation_reason, :revoke]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
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
      revoke: {:const, true}
    ]
  end
end

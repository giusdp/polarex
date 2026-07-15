defmodule Polarex.SubscriptionUpdateBase do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateBase
  """

  @type t :: %__MODULE__{
          discount_id: String.t() | nil,
          product_id: String.t() | nil,
          proration_behavior: String.t() | nil,
          trial_end: DateTime.t() | String.t() | nil
        }

  defstruct [:discount_id, :product_id, :proration_behavior, :trial_end]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      product_id: {:union, [{:string, "uuid4"}, :null]},
      proration_behavior:
        {:union, [{:enum, ["invoice", "prorate", "next_period", "reset"]}, :null]},
      trial_end: {:union, [{:const, "now"}, {:string, "date-time"}, :null]}
    ]
  end
end

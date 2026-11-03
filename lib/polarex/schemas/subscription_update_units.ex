defmodule Polarex.SubscriptionUpdateUnits do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateUnits
  """

  @type t :: %__MODULE__{proration_behavior: String.t() | nil, units: integer}

  defstruct [:proration_behavior, :units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      proration_behavior:
        {:union, [{:enum, ["invoice", "prorate", "next_period", "reset"]}, :null]},
      units: :integer
    ]
  end
end

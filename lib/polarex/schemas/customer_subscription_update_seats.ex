defmodule Polarex.CustomerSubscriptionUpdateSeats do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionUpdateSeats
  """

  @type t :: %__MODULE__{proration_behavior: String.t() | nil, seats: integer}

  defstruct [:proration_behavior, :seats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [proration_behavior: {:union, [{:enum, ["invoice", "prorate"]}, :null]}, seats: :integer]
  end
end

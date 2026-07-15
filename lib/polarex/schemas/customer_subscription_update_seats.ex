defmodule Polarex.CustomerSubscriptionUpdateSeats do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionUpdateSeats
  """

  @type t :: %__MODULE__{seats: integer}

  defstruct [:seats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [seats: :integer]
  end
end

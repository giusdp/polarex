defmodule Polarex.CustomerSubscriptionUpdateUnits do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionUpdateUnits
  """

  @type t :: %__MODULE__{units: integer}

  defstruct [:units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [units: :integer]
  end
end

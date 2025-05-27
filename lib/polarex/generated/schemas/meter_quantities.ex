defmodule Polarex.Generated.MeterQuantities do
  @moduledoc """
  Provides struct and type for a MeterQuantities
  """

  @type t :: %__MODULE__{quantities: [Polarex.Generated.MeterQuantity.t()], total: number}

  defstruct [:quantities, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [quantities: [{Polarex.Generated.MeterQuantity, :t}], total: :number]
  end
end

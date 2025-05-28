defmodule Polarex.MeterQuantities do
  @moduledoc """
  Provides struct and type for a MeterQuantities
  """

  @type t :: %__MODULE__{quantities: [Polarex.MeterQuantity.t()], total: number}

  defstruct [:quantities, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [quantities: [{Polarex.MeterQuantity, :t}], total: :number]
  end
end

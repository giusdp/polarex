defmodule Polarex.PropertyAggregation do
  @moduledoc """
  Provides struct and type for a PropertyAggregation
  """

  @type t :: %__MODULE__{func: String.t(), property: String.t()}

  defstruct [:func, :property]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [func: {:enum, ["sum", "max", "min", "avg"]}, property: {:string, :generic}]
  end
end

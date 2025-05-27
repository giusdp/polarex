defmodule Polarex.Generated.CountAggregation do
  @moduledoc """
  Provides struct and type for a CountAggregation
  """

  @type t :: %__MODULE__{func: String.t() | nil}

  defstruct [:func]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [func: {:const, "count"}]
  end
end

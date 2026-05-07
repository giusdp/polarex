defmodule Polarex.UniqueAggregation do
  @moduledoc """
  Provides struct and type for a UniqueAggregation
  """

  @type t :: %__MODULE__{func: String.t() | nil, property: String.t()}

  defstruct [:func, :property]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [func: {:const, "unique"}, property: :string]
  end
end

defmodule Polarex.Generated.FilterClause do
  @moduledoc """
  Provides struct and type for a FilterClause
  """

  @type t :: %__MODULE__{
          operator: String.t(),
          property: String.t(),
          value: boolean | integer | String.t()
        }

  defstruct [:operator, :property, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      operator: {:enum, ["eq", "ne", "gt", "gte", "lt", "lte", "like", "not_like"]},
      property: {:string, :generic},
      value: {:union, [:boolean, :integer, string: :generic]}
    ]
  end
end

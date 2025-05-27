defmodule Polarex.Generated.Filter do
  @moduledoc """
  Provides struct and type for a Filter
  """

  @type t :: %__MODULE__{
          clauses: [Polarex.Generated.Filter.t() | Polarex.Generated.FilterClause.t()],
          conjunction: String.t()
        }

  defstruct [:clauses, :conjunction]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      clauses: [union: [{Polarex.Generated.Filter, :t}, {Polarex.Generated.FilterClause, :t}]],
      conjunction: {:enum, ["and", "or"]}
    ]
  end
end

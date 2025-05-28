defmodule Polarex.Filter do
  @moduledoc """
  Provides struct and type for a Filter
  """

  @type t :: %__MODULE__{
          clauses: [Polarex.Filter.t() | Polarex.FilterClause.t()],
          conjunction: String.t()
        }

  defstruct [:clauses, :conjunction]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      clauses: [union: [{Polarex.Filter, :t}, {Polarex.FilterClause, :t}]],
      conjunction: {:enum, ["and", "or"]}
    ]
  end
end

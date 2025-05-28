defmodule Polarex.ListResource do
  @moduledoc """
  Provides struct and type for a ListResource
  """

  @type t :: %__MODULE__{
          items: [Polarex.CardPayment.t() | Polarex.GenericPayment.t()],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [union: [{Polarex.CardPayment, :t}, {Polarex.GenericPayment, :t}]],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

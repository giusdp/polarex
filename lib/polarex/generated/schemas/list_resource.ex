defmodule Polarex.Generated.ListResource do
  @moduledoc """
  Provides struct and type for a ListResource
  """

  @type t :: %__MODULE__{
          items: [Polarex.Generated.CardPayment.t() | Polarex.Generated.GenericPayment.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [{Polarex.Generated.CardPayment, :t}, {Polarex.Generated.GenericPayment, :t}]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

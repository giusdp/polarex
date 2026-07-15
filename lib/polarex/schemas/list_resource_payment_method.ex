defmodule Polarex.ListResourcePaymentMethod do
  @moduledoc """
  Provides struct and type for a ListResourcePaymentMethod
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.CustomerPaymentMethodCard.t() | Polarex.CustomerPaymentMethodGeneric.t()
          ],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.CustomerPaymentMethodCard, :t},
          {Polarex.CustomerPaymentMethodGeneric, :t}
        ]
      ],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

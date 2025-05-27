defmodule Polarex.Generated.ListResourceUnionPaymentMethodCardPaymentMethodGeneric do
  @moduledoc """
  Provides struct and type for a ListResourceUnionPaymentMethodCardPaymentMethodGeneric
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.Generated.PaymentMethodCard.t() | Polarex.Generated.PaymentMethodGeneric.t()
          ],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.Generated.PaymentMethodCard, :t},
          {Polarex.Generated.PaymentMethodGeneric, :t}
        ]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

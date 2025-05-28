defmodule Polarex.ListResourceUnionPaymentMethodCardPaymentMethodGeneric do
  @moduledoc """
  Provides struct and type for a ListResourceUnionPaymentMethodCardPaymentMethodGeneric
  """

  @type t :: %__MODULE__{
          items: [Polarex.PaymentMethodCard.t() | Polarex.PaymentMethodGeneric.t()],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [union: [{Polarex.PaymentMethodCard, :t}, {Polarex.PaymentMethodGeneric, :t}]],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

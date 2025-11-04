defmodule Polarex.CustomerPaymentMethodCreateSucceededResponse do
  @moduledoc """
  Provides struct and type for a CustomerPaymentMethodCreateSucceededResponse
  """

  @type t :: %__MODULE__{
          payment_method: Polarex.PaymentMethodCard.t() | Polarex.PaymentMethodGeneric.t(),
          status: String.t()
        }

  defstruct [:payment_method, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payment_method:
        {:union, [{Polarex.PaymentMethodCard, :t}, {Polarex.PaymentMethodGeneric, :t}]},
      status: {:const, "succeeded"}
    ]
  end
end

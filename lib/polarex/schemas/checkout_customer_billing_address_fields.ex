defmodule Polarex.CheckoutCustomerBillingAddressFields do
  @moduledoc """
  Provides struct and type for a CheckoutCustomerBillingAddressFields
  """

  @type t :: %__MODULE__{
          city: boolean,
          country: boolean,
          line1: boolean,
          line2: boolean,
          postal_code: boolean,
          state: boolean
        }

  defstruct [:city, :country, :line1, :line2, :postal_code, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: :boolean,
      country: :boolean,
      line1: :boolean,
      line2: :boolean,
      postal_code: :boolean,
      state: :boolean
    ]
  end
end

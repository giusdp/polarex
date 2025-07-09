defmodule Polarex.CheckoutBillingAddressFields do
  @moduledoc """
  Provides struct and type for a CheckoutBillingAddressFields
  """

  @type t :: %__MODULE__{
          city: String.t(),
          country: String.t(),
          line1: String.t(),
          line2: String.t(),
          postal_code: String.t(),
          state: String.t()
        }

  defstruct [:city, :country, :line1, :line2, :postal_code, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: {:enum, ["required", "optional", "disabled"]},
      country: {:enum, ["required", "optional", "disabled"]},
      line1: {:enum, ["required", "optional", "disabled"]},
      line2: {:enum, ["required", "optional", "disabled"]},
      postal_code: {:enum, ["required", "optional", "disabled"]},
      state: {:enum, ["required", "optional", "disabled"]}
    ]
  end
end

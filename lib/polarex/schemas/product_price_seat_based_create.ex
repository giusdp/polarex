defmodule Polarex.ProductPriceSeatBasedCreate do
  @moduledoc """
  Provides struct and type for a ProductPriceSeatBasedCreate
  """

  @type t :: %__MODULE__{
          amount_type: String.t(),
          price_currency: String.t() | nil,
          seat_tiers: Polarex.ProductPriceSeatTiers.t()
        }

  defstruct [:amount_type, :price_currency, :seat_tiers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_type: {:const, "seat_based"},
      price_currency: {:string, :generic},
      seat_tiers: {Polarex.ProductPriceSeatTiers, :t}
    ]
  end
end

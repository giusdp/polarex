defmodule Polarex.ProductPriceSeatTiersInput do
  @moduledoc """
  Provides struct and type for a ProductPriceSeatTiersInput
  """

  @type t :: %__MODULE__{
          seat_tier_type: String.t() | nil,
          tiers: [Polarex.ProductPriceSeatTier.t()]
        }

  defstruct [:seat_tier_type, :tiers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      seat_tier_type: {:enum, ["volume", "graduated"]},
      tiers: [{Polarex.ProductPriceSeatTier, :t}]
    ]
  end
end

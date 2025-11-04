defmodule Polarex.ProductPriceSeatTiers do
  @moduledoc """
  Provides struct and type for a ProductPriceSeatTiers
  """

  @type t :: %__MODULE__{tiers: [Polarex.ProductPriceSeatTier.t()]}

  defstruct [:tiers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tiers: [{Polarex.ProductPriceSeatTier, :t}]]
  end
end

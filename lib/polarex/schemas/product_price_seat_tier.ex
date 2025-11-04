defmodule Polarex.ProductPriceSeatTier do
  @moduledoc """
  Provides struct and type for a ProductPriceSeatTier
  """

  @type t :: %__MODULE__{max_seats: integer | nil, min_seats: integer, price_per_seat: integer}

  defstruct [:max_seats, :min_seats, :price_per_seat]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_seats: {:union, [:integer, :null]}, min_seats: :integer, price_per_seat: :integer]
  end
end

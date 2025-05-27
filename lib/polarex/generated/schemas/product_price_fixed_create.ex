defmodule Polarex.Generated.ProductPriceFixedCreate do
  @moduledoc """
  Provides struct and type for a ProductPriceFixedCreate
  """

  @type t :: %__MODULE__{
          amount_type: String.t(),
          price_amount: integer,
          price_currency: String.t() | nil
        }

  defstruct [:amount_type, :price_amount, :price_currency]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_type: {:const, "fixed"}, price_amount: :integer, price_currency: {:string, :generic}]
  end
end

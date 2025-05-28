defmodule Polarex.ProductPriceCustomCreate do
  @moduledoc """
  Provides struct and type for a ProductPriceCustomCreate
  """

  @type t :: %__MODULE__{
          amount_type: String.t(),
          maximum_amount: integer | nil,
          minimum_amount: integer | nil,
          preset_amount: integer | nil,
          price_currency: String.t() | nil
        }

  defstruct [:amount_type, :maximum_amount, :minimum_amount, :preset_amount, :price_currency]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_type: {:const, "custom"},
      maximum_amount: {:union, [:integer, :null]},
      minimum_amount: {:union, [:integer, :null]},
      preset_amount: {:union, [:integer, :null]},
      price_currency: {:string, :generic}
    ]
  end
end

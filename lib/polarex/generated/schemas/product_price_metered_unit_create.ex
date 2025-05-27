defmodule Polarex.Generated.ProductPriceMeteredUnitCreate do
  @moduledoc """
  Provides struct and type for a ProductPriceMeteredUnitCreate
  """

  @type t :: %__MODULE__{
          amount_type: String.t(),
          cap_amount: integer | nil,
          meter_id: String.t(),
          price_currency: String.t() | nil,
          unit_amount: number | String.t()
        }

  defstruct [:amount_type, :cap_amount, :meter_id, :price_currency, :unit_amount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_type: {:const, "metered_unit"},
      cap_amount: {:union, [:integer, :null]},
      meter_id: {:string, :generic},
      price_currency: {:string, :generic},
      unit_amount: {:union, [:number, string: :generic]}
    ]
  end
end

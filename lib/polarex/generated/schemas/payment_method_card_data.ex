defmodule Polarex.Generated.PaymentMethodCardData do
  @moduledoc """
  Provides struct and type for a PaymentMethodCardData
  """

  @type t :: %__MODULE__{
          brand: String.t(),
          exp_month: integer,
          exp_year: integer,
          last4: String.t(),
          wallet: String.t() | nil
        }

  defstruct [:brand, :exp_month, :exp_year, :last4, :wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      brand: {:string, :generic},
      exp_month: :integer,
      exp_year: :integer,
      last4: {:string, :generic},
      wallet: {:union, [{:string, :generic}, :null]}
    ]
  end
end

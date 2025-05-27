defmodule Polarex.Generated.ProductPriceFreeCreate do
  @moduledoc """
  Provides struct and type for a ProductPriceFreeCreate
  """

  @type t :: %__MODULE__{amount_type: String.t()}

  defstruct [:amount_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_type: {:const, "free"}]
  end
end

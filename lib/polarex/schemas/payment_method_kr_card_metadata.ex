defmodule Polarex.PaymentMethodKrCardMetadata do
  @moduledoc """
  Provides struct and type for a PaymentMethodKrCardMetadata
  """

  @type t :: %__MODULE__{brand: String.t() | nil, last4: String.t() | nil}

  defstruct [:brand, :last4]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [brand: {:union, [:string, :null]}, last4: {:union, [:string, :null]}]
  end
end

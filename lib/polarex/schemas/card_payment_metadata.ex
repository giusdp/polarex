defmodule Polarex.CardPaymentMetadata do
  @moduledoc """
  Provides struct and type for a CardPaymentMetadata
  """

  @type t :: %__MODULE__{brand: String.t(), last4: String.t()}

  defstruct [:brand, :last4]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [brand: {:string, :generic}, last4: {:string, :generic}]
  end
end

defmodule Polarex.CostMetadataOutput do
  @moduledoc """
  Provides struct and type for a CostMetadataOutput
  """

  @type t :: %__MODULE__{amount: String.t(), currency: String.t()}

  defstruct [:amount, :currency]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount: :string, currency: :string]
  end
end

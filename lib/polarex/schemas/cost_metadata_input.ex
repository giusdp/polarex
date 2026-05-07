defmodule Polarex.CostMetadataInput do
  @moduledoc """
  Provides struct and type for a CostMetadataInput
  """

  @type t :: %__MODULE__{amount: number | String.t(), currency: String.t()}

  defstruct [:amount, :currency]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount: {:union, [:number, :string]}, currency: :string]
  end
end

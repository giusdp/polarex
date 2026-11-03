defmodule Polarex.TierInput do
  @moduledoc """
  Provides struct and type for a TierInput
  """

  @type t :: %__MODULE__{bound: integer | nil, unit_amount: number | String.t()}

  defstruct [:bound, :unit_amount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [bound: {:union, [:integer, :null]}, unit_amount: {:union, [:number, :string]}]
  end
end

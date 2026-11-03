defmodule Polarex.TiersInput do
  @moduledoc """
  Provides struct and type for a TiersInput
  """

  @type t :: %__MODULE__{tiers: [Polarex.TierInput.t()], type: String.t()}

  defstruct [:tiers, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tiers: [{Polarex.TierInput, :t}], type: {:enum, ["volume", "graduated"]}]
  end
end

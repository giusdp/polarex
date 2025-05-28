defmodule Polarex.BenefitCustomProperties do
  @moduledoc """
  Provides struct and type for a BenefitCustomProperties
  """

  @type t :: %__MODULE__{note: String.t() | nil}

  defstruct [:note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [note: {:union, [{:string, :generic}, :null]}]
  end
end

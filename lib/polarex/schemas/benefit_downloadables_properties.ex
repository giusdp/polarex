defmodule Polarex.BenefitDownloadablesProperties do
  @moduledoc """
  Provides struct and type for a BenefitDownloadablesProperties
  """

  @type t :: %__MODULE__{archived: Polarex.Archived.t(), files: [String.t()]}

  defstruct [:archived, :files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [archived: {Polarex.Archived, :t}, files: [string: :generic]]
  end
end

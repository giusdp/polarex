defmodule Polarex.BenefitDownloadablesCreateProperties do
  @moduledoc """
  Provides struct and type for a BenefitDownloadablesCreateProperties
  """

  @type t :: %__MODULE__{archived: Polarex.Archived.t() | nil, files: [String.t()]}

  defstruct [:archived, :files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [archived: {Polarex.Archived, :t}, files: [string: :generic]]
  end
end

defmodule Polarex.BenefitGrantDownloadablesProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantDownloadablesProperties
  """

  @type t :: %__MODULE__{files: [String.t()] | nil}

  defstruct [:files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: [string: :generic]]
  end
end

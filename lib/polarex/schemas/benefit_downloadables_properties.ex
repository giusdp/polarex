defmodule Polarex.BenefitDownloadablesProperties do
  @moduledoc """
  Provides struct and type for a BenefitDownloadablesProperties
  """

  @type t :: %__MODULE__{archived: map, files: [String.t()]}

  defstruct [:archived, :files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [archived: :map, files: [string: "uuid4"]]
  end
end

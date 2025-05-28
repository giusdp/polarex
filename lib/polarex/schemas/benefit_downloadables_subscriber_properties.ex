defmodule Polarex.BenefitDownloadablesSubscriberProperties do
  @moduledoc """
  Provides struct and type for a BenefitDownloadablesSubscriberProperties
  """

  @type t :: %__MODULE__{active_files: [String.t()]}

  defstruct [:active_files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [active_files: [string: :generic]]
  end
end

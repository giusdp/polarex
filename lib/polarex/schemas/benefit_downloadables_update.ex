defmodule Polarex.BenefitDownloadablesUpdate do
  @moduledoc """
  Provides struct and type for a BenefitDownloadablesUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          properties: Polarex.BenefitDownloadablesCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Metadata, :t},
      properties: {:union, [{Polarex.BenefitDownloadablesCreateProperties, :t}, :null]},
      type: {:const, "downloadables"}
    ]
  end
end

defmodule Polarex.Generated.BenefitLicenseKeysUpdate do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeysUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          properties: Polarex.Generated.BenefitLicenseKeysCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      properties: {:union, [{Polarex.Generated.BenefitLicenseKeysCreateProperties, :t}, :null]},
      type: {:const, "license_keys"}
    ]
  end
end

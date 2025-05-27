defmodule Polarex.Generated.BenefitLicenseKeysCreate do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeysCreate
  """

  @type t :: %__MODULE__{
          description: String.t(),
          metadata: Polarex.Generated.Metadata.t() | nil,
          organization_id: String.t() | nil,
          properties: Polarex.Generated.BenefitLicenseKeysCreateProperties.t(),
          type: String.t()
        }

  defstruct [:description, :metadata, :organization_id, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      metadata: {Polarex.Generated.Metadata, :t},
      organization_id: {:union, [{:string, :generic}, :null]},
      properties: {Polarex.Generated.BenefitLicenseKeysCreateProperties, :t},
      type: {:const, "license_keys"}
    ]
  end
end

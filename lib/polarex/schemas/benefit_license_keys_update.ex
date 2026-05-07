defmodule Polarex.BenefitLicenseKeysUpdate do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeysUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: map | nil,
          properties: Polarex.BenefitLicenseKeysCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [:string, :null]},
      metadata: :map,
      properties: {:union, [{Polarex.BenefitLicenseKeysCreateProperties, :t}, :null]},
      type: {:const, "license_keys"}
    ]
  end
end

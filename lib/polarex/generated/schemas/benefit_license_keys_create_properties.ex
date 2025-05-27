defmodule Polarex.Generated.BenefitLicenseKeysCreateProperties do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeysCreateProperties
  """

  @type t :: %__MODULE__{
          activations: Polarex.Generated.BenefitLicenseKeyActivationCreateProperties.t() | nil,
          expires: Polarex.Generated.BenefitLicenseKeyExpirationProperties.t() | nil,
          limit_usage: integer | nil,
          prefix: String.t() | nil
        }

  defstruct [:activations, :expires, :limit_usage, :prefix]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activations:
        {:union, [{Polarex.Generated.BenefitLicenseKeyActivationCreateProperties, :t}, :null]},
      expires: {:union, [{Polarex.Generated.BenefitLicenseKeyExpirationProperties, :t}, :null]},
      limit_usage: {:union, [:integer, :null]},
      prefix: {:union, [{:string, :generic}, :null]}
    ]
  end
end

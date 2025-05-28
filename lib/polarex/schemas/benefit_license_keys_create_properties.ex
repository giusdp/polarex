defmodule Polarex.BenefitLicenseKeysCreateProperties do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeysCreateProperties
  """

  @type t :: %__MODULE__{
          activations: Polarex.BenefitLicenseKeyActivationCreateProperties.t() | nil,
          expires: Polarex.BenefitLicenseKeyExpirationProperties.t() | nil,
          limit_usage: integer | nil,
          prefix: String.t() | nil
        }

  defstruct [:activations, :expires, :limit_usage, :prefix]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activations: {:union, [{Polarex.BenefitLicenseKeyActivationCreateProperties, :t}, :null]},
      expires: {:union, [{Polarex.BenefitLicenseKeyExpirationProperties, :t}, :null]},
      limit_usage: {:union, [:integer, :null]},
      prefix: {:union, [{:string, :generic}, :null]}
    ]
  end
end

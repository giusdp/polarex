defmodule Polarex.Generated.BenefitLicenseKeyExpirationProperties do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeyExpirationProperties
  """

  @type t :: %__MODULE__{timeframe: String.t(), ttl: integer}

  defstruct [:timeframe, :ttl]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [timeframe: {:enum, ["year", "month", "day"]}, ttl: :integer]
  end
end

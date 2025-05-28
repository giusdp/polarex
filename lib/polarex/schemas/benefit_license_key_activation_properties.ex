defmodule Polarex.BenefitLicenseKeyActivationProperties do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeyActivationProperties
  """

  @type t :: %__MODULE__{enable_customer_admin: boolean, limit: integer}

  defstruct [:enable_customer_admin, :limit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enable_customer_admin: :boolean, limit: :integer]
  end
end

defmodule Polarex.Generated.CustomerBenefitGrantLicenseKeysUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantLicenseKeysUpdate
  """

  @type t :: %__MODULE__{benefit_type: String.t()}

  defstruct [:benefit_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [benefit_type: {:const, "license_keys"}]
  end
end

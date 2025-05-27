defmodule Polarex.Generated.BenefitGrantLicenseKeysProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantLicenseKeysProperties
  """

  @type t :: %__MODULE__{display_key: String.t() | nil, license_key_id: String.t() | nil}

  defstruct [:display_key, :license_key_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [display_key: {:string, :generic}, license_key_id: {:string, :generic}]
  end
end

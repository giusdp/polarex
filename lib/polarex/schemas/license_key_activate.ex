defmodule Polarex.LicenseKeyActivate do
  @moduledoc """
  Provides struct and type for a LicenseKeyActivate
  """

  @type t :: %__MODULE__{
          conditions: Polarex.Conditions.t() | nil,
          key: String.t(),
          label: String.t(),
          meta: Polarex.Meta.t() | nil,
          organization_id: String.t()
        }

  defstruct [:conditions, :key, :label, :meta, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditions: {Polarex.Conditions, :t},
      key: {:string, :generic},
      label: {:string, :generic},
      meta: {Polarex.Meta, :t},
      organization_id: {:string, :generic}
    ]
  end
end

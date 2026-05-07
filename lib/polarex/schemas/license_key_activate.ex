defmodule Polarex.LicenseKeyActivate do
  @moduledoc """
  Provides struct and type for a LicenseKeyActivate
  """

  @type t :: %__MODULE__{
          conditions: map | nil,
          key: String.t(),
          label: String.t(),
          meta: map | nil,
          organization_id: String.t()
        }

  defstruct [:conditions, :key, :label, :meta, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditions: :map,
      key: :string,
      label: :string,
      meta: :map,
      organization_id: {:string, "uuid4"}
    ]
  end
end

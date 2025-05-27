defmodule Polarex.Generated.LicenseKeyActivationBase do
  @moduledoc """
  Provides struct and type for a LicenseKeyActivationBase
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          label: String.t(),
          license_key_id: String.t(),
          meta: Polarex.Generated.Meta.t(),
          modified_at: DateTime.t() | nil
        }

  defstruct [:created_at, :id, :label, :license_key_id, :meta, :modified_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: {:string, :generic},
      label: {:string, :generic},
      license_key_id: {:string, :generic},
      meta: {Polarex.Generated.Meta, :t},
      modified_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end

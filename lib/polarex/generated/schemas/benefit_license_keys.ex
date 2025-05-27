defmodule Polarex.Generated.BenefitLicenseKeys do
  @moduledoc """
  Provides struct and type for a BenefitLicenseKeys
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          deletable: boolean,
          description: String.t(),
          id: String.t(),
          metadata: Polarex.Generated.Metadata.t(),
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          properties: Polarex.Generated.BenefitLicenseKeysProperties.t(),
          selectable: boolean,
          type: String.t()
        }

  defstruct [
    :created_at,
    :deletable,
    :description,
    :id,
    :metadata,
    :modified_at,
    :organization_id,
    :properties,
    :selectable,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      deletable: :boolean,
      description: {:string, :generic},
      id: {:string, :generic},
      metadata: {Polarex.Generated.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      organization_id: {:string, :generic},
      properties: {Polarex.Generated.BenefitLicenseKeysProperties, :t},
      selectable: :boolean,
      type: {:const, "license_keys"}
    ]
  end
end

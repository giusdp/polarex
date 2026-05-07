defmodule Polarex.BenefitPublic do
  @moduledoc """
  Provides struct and type for a BenefitPublic
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          deletable: boolean,
          description: String.t(),
          id: String.t(),
          is_deleted: boolean,
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          selectable: boolean,
          type: String.t()
        }

  defstruct [
    :created_at,
    :deletable,
    :description,
    :id,
    :is_deleted,
    :modified_at,
    :organization_id,
    :selectable,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      deletable: :boolean,
      description: :string,
      id: {:string, "uuid4"},
      is_deleted: :boolean,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      organization_id: {:string, "uuid4"},
      selectable: :boolean,
      type:
        {:enum,
         [
           "custom",
           "discord",
           "github_repository",
           "downloadables",
           "license_keys",
           "meter_credit",
           "feature_flag"
         ]}
    ]
  end
end

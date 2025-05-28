defmodule Polarex.BenefitPublic do
  @moduledoc """
  Provides struct and type for a BenefitPublic
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          deletable: boolean,
          description: String.t(),
          id: String.t(),
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
      created_at: {:string, :date_time},
      deletable: :boolean,
      description: {:string, :generic},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      organization_id: {:string, :generic},
      selectable: :boolean,
      type:
        {:enum,
         [
           "custom",
           "discord",
           "github_repository",
           "downloadables",
           "license_keys",
           "meter_credit"
         ]}
    ]
  end
end

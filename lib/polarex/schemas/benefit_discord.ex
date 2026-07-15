defmodule Polarex.BenefitDiscord do
  @moduledoc """
  Provides struct and type for a BenefitDiscord
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          deletable: boolean,
          description: String.t(),
          id: String.t(),
          is_deleted: boolean,
          metadata: map,
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          properties: Polarex.BenefitDiscordProperties.t(),
          selectable: boolean,
          type: String.t(),
          visibility: String.t(),
          visibility_configurable: boolean
        }

  defstruct [
    :created_at,
    :deletable,
    :description,
    :id,
    :is_deleted,
    :metadata,
    :modified_at,
    :organization_id,
    :properties,
    :selectable,
    :type,
    :visibility,
    :visibility_configurable
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
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      organization_id: {:string, "uuid4"},
      properties: {Polarex.BenefitDiscordProperties, :t},
      selectable: :boolean,
      type: {:const, "discord"},
      visibility: {:enum, ["draft", "private", "public"]},
      visibility_configurable: :boolean
    ]
  end
end

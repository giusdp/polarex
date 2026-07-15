defmodule Polarex.BenefitSlackSharedChannelSubscriber do
  @moduledoc """
  Provides struct and type for a BenefitSlackSharedChannelSubscriber
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          deletable: boolean,
          description: String.t(),
          id: String.t(),
          is_deleted: boolean,
          modified_at: DateTime.t() | nil,
          organization: Polarex.BenefitSubscriberOrganization.t(),
          organization_id: String.t(),
          properties: map,
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
    :organization,
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
      created_at: {:string, "date-time"},
      deletable: :boolean,
      description: :string,
      id: {:string, "uuid4"},
      is_deleted: :boolean,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      organization: {Polarex.BenefitSubscriberOrganization, :t},
      organization_id: {:string, "uuid4"},
      properties: :map,
      selectable: :boolean,
      type: {:const, "slack_shared_channel"}
    ]
  end
end

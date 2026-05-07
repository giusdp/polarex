defmodule Polarex.UserEvent do
  @moduledoc """
  Provides struct and type for a UserEvent
  """

  @type t :: %__MODULE__{
          child_count: integer | nil,
          customer: Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t() | nil,
          customer_id: String.t() | nil,
          external_customer_id: String.t() | nil,
          external_member_id: String.t() | nil,
          id: String.t(),
          label: String.t(),
          member_id: String.t() | nil,
          metadata: Polarex.EventMetadataOutput.t(),
          name: String.t(),
          organization_id: String.t(),
          parent_id: String.t() | nil,
          source: String.t(),
          timestamp: DateTime.t()
        }

  defstruct [
    :child_count,
    :customer,
    :customer_id,
    :external_customer_id,
    :external_member_id,
    :id,
    :label,
    :member_id,
    :metadata,
    :name,
    :organization_id,
    :parent_id,
    :source,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      child_count: :integer,
      customer: {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}, :null]},
      customer_id: {:union, [{:string, "uuid4"}, :null]},
      external_customer_id: {:union, [:string, :null]},
      external_member_id: {:union, [:string, :null]},
      id: {:string, "uuid4"},
      label: :string,
      member_id: {:union, [{:string, "uuid4"}, :null]},
      metadata: {Polarex.EventMetadataOutput, :t},
      name: :string,
      organization_id: {:string, "uuid4"},
      parent_id: {:union, [{:string, "uuid4"}, :null]},
      source: {:const, "user"},
      timestamp: {:string, "date-time"}
    ]
  end
end

defmodule Polarex.EventCreateExternalCustomer do
  @moduledoc """
  Provides struct and type for a EventCreateExternalCustomer
  """

  @type t :: %__MODULE__{
          external_customer_id: String.t(),
          external_id: String.t() | nil,
          external_member_id: String.t() | nil,
          metadata: Polarex.EventMetadataInput.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          parent_id: String.t() | nil,
          timestamp: DateTime.t() | nil
        }

  defstruct [
    :external_customer_id,
    :external_id,
    :external_member_id,
    :metadata,
    :name,
    :organization_id,
    :parent_id,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: :string,
      external_id: {:union, [:string, :null]},
      external_member_id: {:union, [:string, :null]},
      metadata: {Polarex.EventMetadataInput, :t},
      name: :string,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      parent_id: {:union, [:string, :null]},
      timestamp: {:string, "date-time"}
    ]
  end
end

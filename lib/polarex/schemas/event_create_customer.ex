defmodule Polarex.EventCreateCustomer do
  @moduledoc """
  Provides struct and type for a EventCreateCustomer
  """

  @type t :: %__MODULE__{
          customer_id: String.t(),
          external_id: String.t() | nil,
          member_id: String.t() | nil,
          metadata: Polarex.EventMetadataInput.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          parent_id: String.t() | nil,
          timestamp: DateTime.t() | nil
        }

  defstruct [
    :customer_id,
    :external_id,
    :member_id,
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
      customer_id: {:string, "uuid4"},
      external_id: {:union, [:string, :null]},
      member_id: {:union, [{:string, "uuid4"}, :null]},
      metadata: {Polarex.EventMetadataInput, :t},
      name: :string,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      parent_id: {:union, [:string, :null]},
      timestamp: {:string, "date-time"}
    ]
  end
end

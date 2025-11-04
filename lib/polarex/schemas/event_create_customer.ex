defmodule Polarex.EventCreateCustomer do
  @moduledoc """
  Provides struct and type for a EventCreateCustomer
  """

  @type t :: %__MODULE__{
          customer_id: String.t(),
          external_id: String.t() | nil,
          metadata: Polarex.EventMetadataInput.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          parent_id: String.t() | nil,
          timestamp: DateTime.t() | nil
        }

  defstruct [
    :customer_id,
    :external_id,
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
      customer_id: {:string, :generic},
      external_id: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.EventMetadataInput, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      parent_id: {:union, [{:string, :generic}, :null]},
      timestamp: {:string, :date_time}
    ]
  end
end

defmodule Polarex.UserEvent do
  @moduledoc """
  Provides struct and type for a UserEvent
  """

  @type t :: %__MODULE__{
          child_count: integer | nil,
          customer: Polarex.Customer.t() | nil,
          customer_id: String.t() | nil,
          external_customer_id: String.t() | nil,
          id: String.t(),
          label: String.t(),
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
    :id,
    :label,
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
      customer: {:union, [{Polarex.Customer, :t}, :null]},
      customer_id: {:union, [{:string, :generic}, :null]},
      external_customer_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      label: {:string, :generic},
      metadata: {Polarex.EventMetadataOutput, :t},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      parent_id: {:union, [{:string, :generic}, :null]},
      source: {:const, "user"},
      timestamp: {:string, :date_time}
    ]
  end
end

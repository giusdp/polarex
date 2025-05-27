defmodule Polarex.Generated.UserEvent do
  @moduledoc """
  Provides struct and type for a UserEvent
  """

  @type t :: %__MODULE__{
          customer: Polarex.Generated.Customer.t() | nil,
          customer_id: String.t() | nil,
          external_customer_id: String.t() | nil,
          id: String.t(),
          metadata: Polarex.Generated.Metadata.t(),
          name: String.t(),
          organization_id: String.t(),
          source: String.t(),
          timestamp: DateTime.t()
        }

  defstruct [
    :customer,
    :customer_id,
    :external_customer_id,
    :id,
    :metadata,
    :name,
    :organization_id,
    :source,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer: {:union, [{Polarex.Generated.Customer, :t}, :null]},
      customer_id: {:union, [{:string, :generic}, :null]},
      external_customer_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      source: {:const, "user"},
      timestamp: {:string, :date_time}
    ]
  end
end

defmodule Polarex.OrderItemSchema do
  @moduledoc """
  Provides struct and type for a OrderItemSchema
  """

  @type t :: %__MODULE__{
          amount: integer,
          created_at: DateTime.t(),
          end_timestamp: DateTime.t() | nil,
          id: String.t(),
          label: String.t(),
          modified_at: DateTime.t() | nil,
          product_price_id: String.t() | nil,
          proration: boolean,
          start_timestamp: DateTime.t() | nil,
          tax_amount: integer
        }

  defstruct [
    :amount,
    :created_at,
    :end_timestamp,
    :id,
    :label,
    :modified_at,
    :product_price_id,
    :proration,
    :start_timestamp,
    :tax_amount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      created_at: {:string, "date-time"},
      end_timestamp: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      label: :string,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      product_price_id: {:union, [{:string, "uuid4"}, :null]},
      proration: :boolean,
      start_timestamp: {:union, [{:string, "date-time"}, :null]},
      tax_amount: :integer
    ]
  end
end

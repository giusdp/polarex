defmodule Polarex.Generated.OrderItemSchema do
  @moduledoc """
  Provides struct and type for a OrderItemSchema
  """

  @type t :: %__MODULE__{
          amount: integer,
          created_at: DateTime.t(),
          id: String.t(),
          label: String.t(),
          modified_at: DateTime.t() | nil,
          product_price_id: String.t() | nil,
          proration: boolean,
          tax_amount: integer
        }

  defstruct [
    :amount,
    :created_at,
    :id,
    :label,
    :modified_at,
    :product_price_id,
    :proration,
    :tax_amount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      created_at: {:string, :date_time},
      id: {:string, :generic},
      label: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      product_price_id: {:union, [{:string, :generic}, :null]},
      proration: :boolean,
      tax_amount: :integer
    ]
  end
end

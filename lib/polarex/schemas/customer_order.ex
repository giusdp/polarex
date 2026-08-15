defmodule Polarex.CustomerOrder do
  @moduledoc """
  Provides struct and type for a CustomerOrder
  """

  @type t :: %__MODULE__{
          applied_balance_amount: integer,
          billing_address: Polarex.Address.t() | nil,
          billing_name: String.t() | nil,
          billing_reason: String.t(),
          checkout_id: String.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          customer_id: String.t(),
          description: String.t(),
          discount_amount: integer,
          discount_id: String.t() | nil,
          due_amount: integer,
          id: String.t(),
          invoice_number: String.t() | nil,
          is_invoice_generated: boolean,
          items: [Polarex.OrderItemSchema.t()],
          modified_at: DateTime.t() | nil,
          net_amount: integer,
          next_payment_attempt_at: DateTime.t() | nil,
          paid: boolean,
          product: Polarex.CustomerOrderProduct.t() | nil,
          product_id: String.t() | nil,
          receipt_number: String.t() | nil,
          refundable_amount: integer,
          refundable_tax_amount: integer,
          refunded_amount: integer,
          refunded_tax_amount: integer,
          seats: integer | nil,
          status: String.t(),
          subscription: Polarex.CustomerOrderSubscription.t() | nil,
          subscription_id: String.t() | nil,
          subtotal_amount: integer,
          tax_amount: integer,
          total_amount: integer
        }

  defstruct [
    :applied_balance_amount,
    :billing_address,
    :billing_name,
    :billing_reason,
    :checkout_id,
    :created_at,
    :currency,
    :customer_id,
    :description,
    :discount_amount,
    :discount_id,
    :due_amount,
    :id,
    :invoice_number,
    :is_invoice_generated,
    :items,
    :modified_at,
    :net_amount,
    :next_payment_attempt_at,
    :paid,
    :product,
    :product_id,
    :receipt_number,
    :refundable_amount,
    :refundable_tax_amount,
    :refunded_amount,
    :refunded_tax_amount,
    :seats,
    :status,
    :subscription,
    :subscription_id,
    :subtotal_amount,
    :tax_amount,
    :total_amount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_balance_amount: :integer,
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      billing_name: {:union, [:string, :null]},
      billing_reason:
        {:enum,
         [
           "purchase",
           "subscription_create",
           "subscription_cycle",
           "subscription_update",
           "subscription_meter_cycle"
         ]},
      checkout_id: {:union, [{:string, "uuid4"}, :null]},
      created_at: {:string, "date-time"},
      currency: :string,
      customer_id: {:string, "uuid4"},
      description: :string,
      discount_amount: :integer,
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      due_amount: :integer,
      id: {:string, "uuid4"},
      invoice_number: {:union, [:string, :null]},
      is_invoice_generated: :boolean,
      items: [{Polarex.OrderItemSchema, :t}],
      modified_at: {:union, [{:string, "date-time"}, :null]},
      net_amount: :integer,
      next_payment_attempt_at: {:union, [{:string, "date-time"}, :null]},
      paid: :boolean,
      product: {:union, [{Polarex.CustomerOrderProduct, :t}, :null]},
      product_id: {:union, [{:string, "uuid4"}, :null]},
      receipt_number: {:union, [:string, :null]},
      refundable_amount: :integer,
      refundable_tax_amount: :integer,
      refunded_amount: :integer,
      refunded_tax_amount: :integer,
      seats: {:union, [:integer, :null]},
      status: {:enum, ["draft", "pending", "paid", "refunded", "partially_refunded", "void"]},
      subscription: {:union, [{Polarex.CustomerOrderSubscription, :t}, :null]},
      subscription_id: {:union, [{:string, "uuid4"}, :null]},
      subtotal_amount: :integer,
      tax_amount: :integer,
      total_amount: :integer
    ]
  end
end

defmodule Polarex.CustomerOrder do
  @moduledoc """
  Provides struct and type for a CustomerOrder
  """

  @type t :: %__MODULE__{
          amount: integer,
          billing_address: Polarex.Address.t() | nil,
          billing_reason: String.t(),
          checkout_id: String.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          customer_id: String.t(),
          discount_amount: integer,
          discount_id: String.t() | nil,
          id: String.t(),
          items: [Polarex.OrderItemSchema.t()],
          modified_at: DateTime.t() | nil,
          net_amount: integer,
          paid: boolean,
          product: Polarex.CustomerOrderProduct.t(),
          product_id: String.t(),
          refunded_amount: integer,
          refunded_tax_amount: integer,
          status: String.t(),
          subscription: Polarex.CustomerOrderSubscription.t() | nil,
          subscription_id: String.t() | nil,
          subtotal_amount: integer,
          tax_amount: integer,
          total_amount: integer,
          user_id: String.t()
        }

  defstruct [
    :amount,
    :billing_address,
    :billing_reason,
    :checkout_id,
    :created_at,
    :currency,
    :customer_id,
    :discount_amount,
    :discount_id,
    :id,
    :items,
    :modified_at,
    :net_amount,
    :paid,
    :product,
    :product_id,
    :refunded_amount,
    :refunded_tax_amount,
    :status,
    :subscription,
    :subscription_id,
    :subtotal_amount,
    :tax_amount,
    :total_amount,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      billing_reason:
        {:enum, ["purchase", "subscription_create", "subscription_cycle", "subscription_update"]},
      checkout_id: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      customer_id: {:string, :generic},
      discount_amount: :integer,
      discount_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      items: [{Polarex.OrderItemSchema, :t}],
      modified_at: {:union, [{:string, :date_time}, :null]},
      net_amount: :integer,
      paid: :boolean,
      product: {Polarex.CustomerOrderProduct, :t},
      product_id: {:string, :generic},
      refunded_amount: :integer,
      refunded_tax_amount: :integer,
      status: {:enum, ["pending", "paid", "refunded", "partially_refunded"]},
      subscription: {:union, [{Polarex.CustomerOrderSubscription, :t}, :null]},
      subscription_id: {:union, [{:string, :generic}, :null]},
      subtotal_amount: :integer,
      tax_amount: :integer,
      total_amount: :integer,
      user_id: {:string, :generic}
    ]
  end
end

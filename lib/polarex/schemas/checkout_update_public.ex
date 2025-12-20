defmodule Polarex.CheckoutUpdatePublic do
  @moduledoc """
  Provides struct and type for a CheckoutUpdatePublic
  """

  @type t :: %__MODULE__{
          allow_trial: false | nil,
          amount: integer | nil,
          custom_field_data: Polarex.CustomFieldData.t() | nil,
          customer_billing_address: Polarex.AddressInput.t() | nil,
          customer_billing_name: String.t() | nil,
          customer_email: String.t() | nil,
          customer_name: String.t() | nil,
          customer_tax_id: String.t() | nil,
          discount_code: String.t() | nil,
          is_business_customer: boolean | nil,
          product_id: String.t() | nil,
          product_price_id: String.t() | nil,
          seats: integer | nil
        }

  defstruct [
    :allow_trial,
    :amount,
    :custom_field_data,
    :customer_billing_address,
    :customer_billing_name,
    :customer_email,
    :customer_name,
    :customer_tax_id,
    :discount_code,
    :is_business_customer,
    :product_id,
    :product_price_id,
    :seats
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_trial: {:union, [{:const, false}, :null]},
      amount: {:union, [:integer, :null]},
      custom_field_data: {Polarex.CustomFieldData, :t},
      customer_billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      customer_billing_name: {:union, [{:string, :generic}, :null]},
      customer_email: {:union, [{:string, :email}, :null]},
      customer_name: {:union, [{:string, :generic}, :null]},
      customer_tax_id: {:union, [{:string, :generic}, :null]},
      discount_code: {:union, [{:string, :generic}, :null]},
      is_business_customer: {:union, [:boolean, :null]},
      product_id: {:union, [{:string, :generic}, :null]},
      product_price_id: {:union, [{:string, :generic}, :null]},
      seats: {:union, [:integer, :null]}
    ]
  end
end

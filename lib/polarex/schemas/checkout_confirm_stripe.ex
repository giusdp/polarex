defmodule Polarex.CheckoutConfirmStripe do
  @moduledoc """
  Provides struct and type for a CheckoutConfirmStripe
  """

  @type t :: %__MODULE__{
          amount: integer | nil,
          confirmation_token_id: String.t() | nil,
          custom_field_data: Polarex.CustomFieldData.t() | nil,
          customer_billing_address: Polarex.Address.t() | nil,
          customer_billing_name: String.t() | nil,
          customer_email: String.t() | nil,
          customer_name: String.t() | nil,
          customer_tax_id: String.t() | nil,
          discount_code: String.t() | nil,
          is_business_customer: boolean | nil,
          product_id: String.t() | nil,
          product_price_id: String.t() | nil
        }

  defstruct [
    :amount,
    :confirmation_token_id,
    :custom_field_data,
    :customer_billing_address,
    :customer_billing_name,
    :customer_email,
    :customer_name,
    :customer_tax_id,
    :discount_code,
    :is_business_customer,
    :product_id,
    :product_price_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {:union, [:integer, :null]},
      confirmation_token_id: {:union, [{:string, :generic}, :null]},
      custom_field_data: {Polarex.CustomFieldData, :t},
      customer_billing_address: {:union, [{Polarex.Address, :t}, :null]},
      customer_billing_name: {:union, [{:string, :generic}, :null]},
      customer_email: {:union, [{:string, :email}, :null]},
      customer_name: {:union, [{:string, :generic}, :null]},
      customer_tax_id: {:union, [{:string, :generic}, :null]},
      discount_code: {:union, [{:string, :generic}, :null]},
      is_business_customer: {:union, [:boolean, :null]},
      product_id: {:union, [{:string, :generic}, :null]},
      product_price_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

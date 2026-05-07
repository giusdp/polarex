defmodule Polarex.CheckoutConfirmStripe do
  @moduledoc """
  Provides struct and type for a CheckoutConfirmStripe
  """

  @type t :: %__MODULE__{
          allow_trial: false | nil,
          amount: integer | nil,
          confirmation_token_id: String.t() | nil,
          custom_field_data: map | nil,
          customer_billing_address: Polarex.AddressInput.t() | nil,
          customer_billing_name: String.t() | nil,
          customer_email: String.t() | nil,
          customer_name: String.t() | nil,
          customer_tax_id: String.t() | nil,
          discount_code: String.t() | nil,
          is_business_customer: boolean | nil,
          locale: String.t() | nil,
          product_id: String.t() | nil,
          product_price_id: String.t() | nil,
          seats: integer | nil
        }

  defstruct [
    :allow_trial,
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
    :locale,
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
      confirmation_token_id: {:union, [:string, :null]},
      custom_field_data: :map,
      customer_billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      customer_billing_name: {:union, [:string, :null]},
      customer_email: {:union, [{:string, "email"}, :null]},
      customer_name: {:union, [:string, :null]},
      customer_tax_id: {:union, [:string, :null]},
      discount_code: {:union, [:string, :null]},
      is_business_customer: {:union, [:boolean, :null]},
      locale: {:union, [:string, :null]},
      product_id: {:union, [{:string, "uuid4"}, :null]},
      product_price_id: {:union, [{:string, "uuid4"}, :null]},
      seats: {:union, [:integer, :null]}
    ]
  end
end

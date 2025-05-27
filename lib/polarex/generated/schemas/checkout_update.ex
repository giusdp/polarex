defmodule Polarex.Generated.CheckoutUpdate do
  @moduledoc """
  Provides struct and type for a CheckoutUpdate
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          amount: integer | nil,
          custom_field_data: Polarex.Generated.CustomFieldData.t() | nil,
          customer_billing_address: Polarex.Generated.Address.t() | nil,
          customer_billing_name: String.t() | nil,
          customer_email: String.t() | nil,
          customer_ip_address: String.t() | nil,
          customer_metadata: Polarex.Generated.CheckoutUpdateCustomerMetadata.t() | nil,
          customer_name: String.t() | nil,
          customer_tax_id: String.t() | nil,
          discount_id: String.t() | nil,
          embed_origin: String.t() | nil,
          is_business_customer: boolean | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          product_id: String.t() | nil,
          product_price_id: String.t() | nil,
          require_billing_address: boolean | nil,
          success_url: String.t() | nil
        }

  defstruct [
    :allow_discount_codes,
    :amount,
    :custom_field_data,
    :customer_billing_address,
    :customer_billing_name,
    :customer_email,
    :customer_ip_address,
    :customer_metadata,
    :customer_name,
    :customer_tax_id,
    :discount_id,
    :embed_origin,
    :is_business_customer,
    :metadata,
    :product_id,
    :product_price_id,
    :require_billing_address,
    :success_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: {:union, [:boolean, :null]},
      amount: {:union, [:integer, :null]},
      custom_field_data: {Polarex.Generated.CustomFieldData, :t},
      customer_billing_address: {:union, [{Polarex.Generated.Address, :t}, :null]},
      customer_billing_name: {:union, [{:string, :generic}, :null]},
      customer_email: {:union, [{:string, :email}, :null]},
      customer_ip_address: {:union, [{:string, :generic}, :null]},
      customer_metadata:
        {:union, [{Polarex.Generated.CheckoutUpdateCustomerMetadata, :t}, :null]},
      customer_name: {:union, [{:string, :generic}, :null]},
      customer_tax_id: {:union, [{:string, :generic}, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      embed_origin: {:union, [{:string, :generic}, :null]},
      is_business_customer: {:union, [:boolean, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      product_id: {:union, [{:string, :generic}, :null]},
      product_price_id: {:union, [{:string, :generic}, :null]},
      require_billing_address: {:union, [:boolean, :null]},
      success_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end

defmodule Polarex.CheckoutUpdate do
  @moduledoc """
  Provides struct and type for a CheckoutUpdate
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          amount: integer | nil,
          custom_field_data: Polarex.CustomFieldData.t() | nil,
          customer_billing_address: Polarex.AddressInput.t() | nil,
          customer_billing_name: String.t() | nil,
          customer_email: String.t() | nil,
          customer_ip_address: String.t() | nil,
          customer_metadata: Polarex.CheckoutUpdateCustomerMetadata.t() | nil,
          customer_name: String.t() | nil,
          customer_tax_id: String.t() | nil,
          discount_id: String.t() | nil,
          embed_origin: String.t() | nil,
          is_business_customer: boolean | nil,
          metadata: Polarex.Metadata.t() | nil,
          product_id: String.t() | nil,
          product_price_id: String.t() | nil,
          require_billing_address: boolean | nil,
          return_url: String.t() | nil,
          seats: integer | nil,
          success_url: String.t() | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil
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
    :return_url,
    :seats,
    :success_url,
    :trial_interval,
    :trial_interval_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: {:union, [:boolean, :null]},
      amount: {:union, [:integer, :null]},
      custom_field_data: {Polarex.CustomFieldData, :t},
      customer_billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      customer_billing_name: {:union, [{:string, :generic}, :null]},
      customer_email: {:union, [{:string, :email}, :null]},
      customer_ip_address: {:union, [{:string, :generic}, :null]},
      customer_metadata: {:union, [{Polarex.CheckoutUpdateCustomerMetadata, :t}, :null]},
      customer_name: {:union, [{:string, :generic}, :null]},
      customer_tax_id: {:union, [{:string, :generic}, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      embed_origin: {:union, [{:string, :generic}, :null]},
      is_business_customer: {:union, [:boolean, :null]},
      metadata: {Polarex.Metadata, :t},
      product_id: {:union, [{:string, :generic}, :null]},
      product_price_id: {:union, [{:string, :generic}, :null]},
      require_billing_address: {:union, [:boolean, :null]},
      return_url: {:union, [{:string, :uri}, :null]},
      seats: {:union, [:integer, :null]},
      success_url: {:union, [{:string, :uri}, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]}
    ]
  end
end

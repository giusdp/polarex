defmodule Polarex.CheckoutProductsCreate do
  @moduledoc """
  Provides struct and type for a CheckoutProductsCreate
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          amount: integer | nil,
          custom_field_data: Polarex.CustomFieldData.t() | nil,
          customer_billing_address: Polarex.Address.t() | nil,
          customer_billing_name: String.t() | nil,
          customer_email: String.t() | nil,
          customer_external_id: String.t() | nil,
          customer_id: String.t() | nil,
          customer_ip_address: String.t() | nil,
          customer_metadata: Polarex.CustomerMetadata.t() | nil,
          customer_name: String.t() | nil,
          customer_tax_id: String.t() | nil,
          discount_id: String.t() | nil,
          embed_origin: String.t() | nil,
          is_business_customer: boolean | nil,
          metadata: Polarex.Metadata.t() | nil,
          products: [String.t()],
          require_billing_address: boolean | nil,
          subscription_id: String.t() | nil,
          success_url: String.t() | nil
        }

  defstruct [
    :allow_discount_codes,
    :amount,
    :custom_field_data,
    :customer_billing_address,
    :customer_billing_name,
    :customer_email,
    :customer_external_id,
    :customer_id,
    :customer_ip_address,
    :customer_metadata,
    :customer_name,
    :customer_tax_id,
    :discount_id,
    :embed_origin,
    :is_business_customer,
    :metadata,
    :products,
    :require_billing_address,
    :subscription_id,
    :success_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: :boolean,
      amount: {:union, [:integer, :null]},
      custom_field_data: {Polarex.CustomFieldData, :t},
      customer_billing_address: {:union, [{Polarex.Address, :t}, :null]},
      customer_billing_name: {:union, [{:string, :generic}, :null]},
      customer_email: {:union, [{:string, :email}, :null]},
      customer_external_id: {:union, [{:string, :generic}, :null]},
      customer_id: {:union, [{:string, :generic}, :null]},
      customer_ip_address: {:union, [{:string, :generic}, :null]},
      customer_metadata: {Polarex.CustomerMetadata, :t},
      customer_name: {:union, [{:string, :generic}, :null]},
      customer_tax_id: {:union, [{:string, :generic}, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      embed_origin: {:union, [{:string, :generic}, :null]},
      is_business_customer: :boolean,
      metadata: {Polarex.Metadata, :t},
      products: [string: :generic],
      require_billing_address: :boolean,
      subscription_id: {:union, [{:string, :generic}, :null]},
      success_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end

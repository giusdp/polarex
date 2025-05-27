defmodule Polarex.Generated.CheckoutLinkCreateProducts do
  @moduledoc """
  Provides struct and type for a CheckoutLinkCreateProducts
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          discount_id: String.t() | nil,
          label: String.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          payment_processor: String.t(),
          products: [String.t()],
          require_billing_address: boolean | nil,
          success_url: String.t() | nil
        }

  defstruct [
    :allow_discount_codes,
    :discount_id,
    :label,
    :metadata,
    :payment_processor,
    :products,
    :require_billing_address,
    :success_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: :boolean,
      discount_id: {:union, [{:string, :generic}, :null]},
      label: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      payment_processor: {:const, "stripe"},
      products: [string: :generic],
      require_billing_address: :boolean,
      success_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end

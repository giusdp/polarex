defmodule Polarex.Generated.CheckoutLinkUpdate do
  @moduledoc """
  Provides struct and type for a CheckoutLinkUpdate
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          discount_id: String.t() | nil,
          label: String.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          products: [String.t()] | nil,
          require_billing_address: boolean | nil,
          success_url: String.t() | nil
        }

  defstruct [
    :allow_discount_codes,
    :discount_id,
    :label,
    :metadata,
    :products,
    :require_billing_address,
    :success_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: {:union, [:boolean, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      label: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      products: {:union, [[string: :generic], :null]},
      require_billing_address: {:union, [:boolean, :null]},
      success_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end

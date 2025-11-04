defmodule Polarex.CheckoutLinkCreateProduct do
  @moduledoc """
  Provides struct and type for a CheckoutLinkCreateProduct
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          discount_id: String.t() | nil,
          label: String.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          payment_processor: String.t(),
          product_id: String.t(),
          require_billing_address: boolean | nil,
          success_url: String.t() | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil
        }

  defstruct [
    :allow_discount_codes,
    :discount_id,
    :label,
    :metadata,
    :payment_processor,
    :product_id,
    :require_billing_address,
    :success_url,
    :trial_interval,
    :trial_interval_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: :boolean,
      discount_id: {:union, [{:string, :generic}, :null]},
      label: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Metadata, :t},
      payment_processor: {:const, "stripe"},
      product_id: {:string, :generic},
      require_billing_address: :boolean,
      success_url: {:union, [{:string, :uri}, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]}
    ]
  end
end

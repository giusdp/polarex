defmodule Polarex.CheckoutLink do
  @moduledoc """
  Provides struct and type for a CheckoutLink
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean,
          client_secret: String.t(),
          created_at: DateTime.t(),
          discount: map | nil,
          discount_id: String.t() | nil,
          id: String.t(),
          label: String.t() | nil,
          metadata: Polarex.Metadata.t(),
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          payment_processor: String.t(),
          products: [Polarex.CheckoutLinkProduct.t()],
          require_billing_address: boolean,
          success_url: String.t() | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil,
          url: String.t()
        }

  defstruct [
    :allow_discount_codes,
    :client_secret,
    :created_at,
    :discount,
    :discount_id,
    :id,
    :label,
    :metadata,
    :modified_at,
    :organization_id,
    :payment_processor,
    :products,
    :require_billing_address,
    :success_url,
    :trial_interval,
    :trial_interval_count,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_discount_codes: :boolean,
      client_secret: {:string, :generic},
      created_at: {:string, :date_time},
      discount: {:union, [:map, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      label: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      organization_id: {:string, :generic},
      payment_processor: {:const, "stripe"},
      products: [{Polarex.CheckoutLinkProduct, :t}],
      require_billing_address: :boolean,
      success_url: {:union, [{:string, :generic}, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      url: {:string, :generic}
    ]
  end
end

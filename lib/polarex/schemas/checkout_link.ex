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
          metadata: map,
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          payment_processor: String.t(),
          products: [Polarex.CheckoutLinkProduct.t()],
          require_billing_address: boolean,
          return_url: String.t() | nil,
          seats: integer | nil,
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
    :return_url,
    :seats,
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
      client_secret: :string,
      created_at: {:string, "date-time"},
      discount: {:union, [:map, :null]},
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      id: {:string, "uuid4"},
      label: {:union, [:string, :null]},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      organization_id: {:string, "uuid4"},
      payment_processor: {:const, "stripe"},
      products: [{Polarex.CheckoutLinkProduct, :t}],
      require_billing_address: :boolean,
      return_url: {:union, [:string, :null]},
      seats: {:union, [:integer, :null]},
      success_url: {:union, [:string, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      url: :string
    ]
  end
end

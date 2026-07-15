defmodule Polarex.CheckoutLinkUpdate do
  @moduledoc """
  Provides struct and type for a CheckoutLinkUpdate
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          discount_id: String.t() | nil,
          label: String.t() | nil,
          metadata: map | nil,
          products: [String.t()] | nil,
          require_billing_address: boolean | nil,
          return_url: String.t() | nil,
          seats: integer | nil,
          success_url: String.t() | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil
        }

  defstruct [
    :allow_discount_codes,
    :discount_id,
    :label,
    :metadata,
    :products,
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
      discount_id: {:union, [{:string, "uuid4"}, :null]},
      label: {:union, [:string, :null]},
      metadata: :map,
      products: {:union, [[string: "uuid4"], :null]},
      require_billing_address: {:union, [:boolean, :null]},
      return_url: {:union, [{:string, "uri"}, :null]},
      seats: {:union, [:integer, :null]},
      success_url: {:union, [{:string, "uri"}, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]}
    ]
  end
end

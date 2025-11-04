defmodule Polarex.CheckoutLinkUpdate do
  @moduledoc """
  Provides struct and type for a CheckoutLinkUpdate
  """

  @type t :: %__MODULE__{
          allow_discount_codes: boolean | nil,
          discount_id: String.t() | nil,
          label: String.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          products: [String.t()] | nil,
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
    :products,
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
      allow_discount_codes: {:union, [:boolean, :null]},
      discount_id: {:union, [{:string, :generic}, :null]},
      label: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Metadata, :t},
      products: {:union, [[string: :generic], :null]},
      require_billing_address: {:union, [:boolean, :null]},
      success_url: {:union, [{:string, :uri}, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]}
    ]
  end
end

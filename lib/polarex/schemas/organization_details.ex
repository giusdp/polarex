defmodule Polarex.OrganizationDetails do
  @moduledoc """
  Provides struct and type for a OrganizationDetails
  """

  @type t :: %__MODULE__{
          about: String.t() | nil,
          customer_acquisition: [String.t()] | nil,
          future_annual_revenue: integer | nil,
          intended_use: String.t() | nil,
          previous_annual_revenue: integer | nil,
          pricing_models: [String.t()] | nil,
          product_description: String.t() | nil,
          selling_categories: [String.t()] | nil,
          switching: boolean | nil,
          switching_from: String.t() | nil
        }

  defstruct [
    :about,
    :customer_acquisition,
    :future_annual_revenue,
    :intended_use,
    :previous_annual_revenue,
    :pricing_models,
    :product_description,
    :selling_categories,
    :switching,
    :switching_from
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      about: {:union, [:string, :null]},
      customer_acquisition: [:string],
      future_annual_revenue: {:union, [:integer, :null]},
      intended_use: {:union, [:string, :null]},
      previous_annual_revenue: {:union, [:integer, :null]},
      pricing_models: [:string],
      product_description: {:union, [:string, :null]},
      selling_categories: [:string],
      switching: :boolean,
      switching_from:
        {:union, [{:enum, ["paddle", "lemon_squeezy", "gumroad", "stripe", "other"]}, :null]}
    ]
  end
end

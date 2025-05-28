defmodule Polarex.OrganizationDetails do
  @moduledoc """
  Provides struct and type for a OrganizationDetails
  """

  @type t :: %__MODULE__{
          about: String.t(),
          customer_acquisition: [String.t()],
          future_annual_revenue: integer,
          intended_use: String.t(),
          previous_annual_revenue: integer | nil,
          product_description: String.t(),
          switching: boolean | nil,
          switching_from: String.t() | nil
        }

  defstruct [
    :about,
    :customer_acquisition,
    :future_annual_revenue,
    :intended_use,
    :previous_annual_revenue,
    :product_description,
    :switching,
    :switching_from
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      about: {:string, :generic},
      customer_acquisition: [string: :generic],
      future_annual_revenue: :integer,
      intended_use: {:string, :generic},
      previous_annual_revenue: :integer,
      product_description: {:string, :generic},
      switching: :boolean,
      switching_from:
        {:union, [{:enum, ["paddle", "lemon_squeezy", "gumroad", "stripe", "other"]}, :null]}
    ]
  end
end

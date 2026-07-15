defmodule Polarex.OrganizationFeatureSettingsUpdate do
  @moduledoc """
  Provides struct and type for a OrganizationFeatureSettingsUpdate
  """

  @type t :: %__MODULE__{
          checkout_localization_enabled: boolean | nil,
          member_model_enabled: boolean | nil,
          overview_metrics: [String.t()] | nil,
          seat_based_pricing_enabled: boolean | nil
        }

  defstruct [
    :checkout_localization_enabled,
    :member_model_enabled,
    :overview_metrics,
    :seat_based_pricing_enabled
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkout_localization_enabled: :boolean,
      member_model_enabled: :boolean,
      overview_metrics: {:union, [[:string], :null]},
      seat_based_pricing_enabled: :boolean
    ]
  end
end

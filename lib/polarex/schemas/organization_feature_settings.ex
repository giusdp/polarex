defmodule Polarex.OrganizationFeatureSettings do
  @moduledoc """
  Provides struct and type for a OrganizationFeatureSettings
  """

  @type t :: %__MODULE__{
          account_review_v2_enabled: boolean | nil,
          billing_enabled: boolean | nil,
          checkout_localization_enabled: boolean | nil,
          issue_funding_enabled: boolean | nil,
          member_model_enabled: boolean | nil,
          off_session_charges_enabled: boolean | nil,
          overview_metrics: [String.t()] | nil,
          reset_proration_behavior_enabled: boolean | nil,
          seat_based_pricing_enabled: boolean | nil,
          wallets_enabled: boolean | nil
        }

  defstruct [
    :account_review_v2_enabled,
    :billing_enabled,
    :checkout_localization_enabled,
    :issue_funding_enabled,
    :member_model_enabled,
    :off_session_charges_enabled,
    :overview_metrics,
    :reset_proration_behavior_enabled,
    :seat_based_pricing_enabled,
    :wallets_enabled
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account_review_v2_enabled: :boolean,
      billing_enabled: :boolean,
      checkout_localization_enabled: :boolean,
      issue_funding_enabled: :boolean,
      member_model_enabled: :boolean,
      off_session_charges_enabled: :boolean,
      overview_metrics: {:union, [[:string], :null]},
      reset_proration_behavior_enabled: :boolean,
      seat_based_pricing_enabled: :boolean,
      wallets_enabled: :boolean
    ]
  end
end

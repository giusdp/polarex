defmodule Polarex.OrganizationFeatureSettings do
  @moduledoc """
  Provides struct and type for a OrganizationFeatureSettings
  """

  @type t :: %__MODULE__{
          checkout_localization_enabled: boolean | nil,
          compass_enabled: boolean | nil,
          dispute_auto_accept_enabled: boolean | nil,
          disputes_enabled: boolean | nil,
          issue_funding_enabled: boolean | nil,
          member_model_enabled: boolean | nil,
          merchant_migration_enabled: boolean | nil,
          off_session_charges_enabled: boolean | nil,
          overview_metrics: [String.t()] | nil,
          preview_access_enabled: boolean | nil,
          reset_proration_behavior_enabled: boolean | nil,
          seat_based_pricing_enabled: boolean | nil,
          slack_benefit_enabled: boolean | nil,
          sso_enabled: boolean | nil,
          wallets_enabled: boolean | nil
        }

  defstruct [
    :checkout_localization_enabled,
    :compass_enabled,
    :dispute_auto_accept_enabled,
    :disputes_enabled,
    :issue_funding_enabled,
    :member_model_enabled,
    :merchant_migration_enabled,
    :off_session_charges_enabled,
    :overview_metrics,
    :preview_access_enabled,
    :reset_proration_behavior_enabled,
    :seat_based_pricing_enabled,
    :slack_benefit_enabled,
    :sso_enabled,
    :wallets_enabled
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkout_localization_enabled: :boolean,
      compass_enabled: :boolean,
      dispute_auto_accept_enabled: :boolean,
      disputes_enabled: :boolean,
      issue_funding_enabled: :boolean,
      member_model_enabled: :boolean,
      merchant_migration_enabled: :boolean,
      off_session_charges_enabled: :boolean,
      overview_metrics: {:union, [[:string], :null]},
      preview_access_enabled: :boolean,
      reset_proration_behavior_enabled: :boolean,
      seat_based_pricing_enabled: :boolean,
      slack_benefit_enabled: :boolean,
      sso_enabled: :boolean,
      wallets_enabled: :boolean
    ]
  end
end

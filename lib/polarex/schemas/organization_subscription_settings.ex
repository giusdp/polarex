defmodule Polarex.OrganizationSubscriptionSettings do
  @moduledoc """
  Provides struct and type for a OrganizationSubscriptionSettings
  """

  @type t :: %__MODULE__{
          allow_customer_updates: boolean,
          allow_multiple_subscriptions: boolean,
          benefit_revocation_grace_period: integer,
          prevent_trial_abuse: boolean,
          proration_behavior: String.t()
        }

  defstruct [
    :allow_customer_updates,
    :allow_multiple_subscriptions,
    :benefit_revocation_grace_period,
    :prevent_trial_abuse,
    :proration_behavior
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_customer_updates: :boolean,
      allow_multiple_subscriptions: :boolean,
      benefit_revocation_grace_period: :integer,
      prevent_trial_abuse: :boolean,
      proration_behavior: {:enum, ["invoice", "prorate", "next_period"]}
    ]
  end
end

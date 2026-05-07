defmodule Polarex.OrganizationCustomerEmailSettings do
  @moduledoc """
  Provides struct and type for a OrganizationCustomerEmailSettings
  """

  @type t :: %__MODULE__{
          order_confirmation: boolean,
          subscription_cancellation: boolean,
          subscription_confirmation: boolean,
          subscription_cycled: boolean,
          subscription_cycled_after_trial: boolean,
          subscription_past_due: boolean,
          subscription_renewal_reminder: boolean,
          subscription_revoked: boolean,
          subscription_trial_conversion_reminder: boolean,
          subscription_uncanceled: boolean,
          subscription_updated: boolean
        }

  defstruct [
    :order_confirmation,
    :subscription_cancellation,
    :subscription_confirmation,
    :subscription_cycled,
    :subscription_cycled_after_trial,
    :subscription_past_due,
    :subscription_renewal_reminder,
    :subscription_revoked,
    :subscription_trial_conversion_reminder,
    :subscription_uncanceled,
    :subscription_updated
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      order_confirmation: :boolean,
      subscription_cancellation: :boolean,
      subscription_confirmation: :boolean,
      subscription_cycled: :boolean,
      subscription_cycled_after_trial: :boolean,
      subscription_past_due: :boolean,
      subscription_renewal_reminder: :boolean,
      subscription_revoked: :boolean,
      subscription_trial_conversion_reminder: :boolean,
      subscription_uncanceled: :boolean,
      subscription_updated: :boolean
    ]
  end
end

defmodule Polarex.OrganizationCapabilities do
  @moduledoc """
  Provides struct and type for a OrganizationCapabilities
  """

  @type t :: %__MODULE__{
          api_access: boolean,
          checkout_payments: boolean,
          dashboard_access: boolean,
          payouts: boolean,
          refunds: boolean,
          subscription_renewals: boolean
        }

  defstruct [
    :api_access,
    :checkout_payments,
    :dashboard_access,
    :payouts,
    :refunds,
    :subscription_renewals
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_access: :boolean,
      checkout_payments: :boolean,
      dashboard_access: :boolean,
      payouts: :boolean,
      refunds: :boolean,
      subscription_renewals: :boolean
    ]
  end
end

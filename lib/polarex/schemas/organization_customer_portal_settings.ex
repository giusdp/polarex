defmodule Polarex.OrganizationCustomerPortalSettings do
  @moduledoc """
  Provides struct and type for a OrganizationCustomerPortalSettings
  """

  @type t :: %__MODULE__{
          customer: Polarex.CustomerPortalCustomerSettings.t() | nil,
          subscription: Polarex.CustomerPortalSubscriptionSettings.t(),
          usage: Polarex.CustomerPortalUsageSettings.t()
        }

  defstruct [:customer, :subscription, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer: {Polarex.CustomerPortalCustomerSettings, :t},
      subscription: {Polarex.CustomerPortalSubscriptionSettings, :t},
      usage: {Polarex.CustomerPortalUsageSettings, :t}
    ]
  end
end

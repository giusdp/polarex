defmodule Polarex.OrganizationCustomerPortalSettings do
  @moduledoc """
  Provides struct and type for a OrganizationCustomerPortalSettings
  """

  @type t :: %__MODULE__{
          subscription: Polarex.CustomerPortalSubscriptionSettings.t(),
          usage: Polarex.CustomerPortalUsageSettings.t()
        }

  defstruct [:subscription, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      subscription: {Polarex.CustomerPortalSubscriptionSettings, :t},
      usage: {Polarex.CustomerPortalUsageSettings, :t}
    ]
  end
end

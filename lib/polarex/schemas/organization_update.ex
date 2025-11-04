defmodule Polarex.OrganizationUpdate do
  @moduledoc """
  Provides struct and type for a OrganizationUpdate
  """

  @type t :: %__MODULE__{
          avatar_url: String.t() | nil,
          customer_email_settings: Polarex.OrganizationCustomerEmailSettings.t() | nil,
          details: Polarex.OrganizationDetails.t() | nil,
          email: String.t() | nil,
          feature_settings: Polarex.OrganizationFeatureSettings.t() | nil,
          name: String.t() | nil,
          notification_settings: Polarex.OrganizationNotificationSettings.t() | nil,
          socials: [Polarex.OrganizationSocialLink.t()] | nil,
          subscription_settings: Polarex.OrganizationSubscriptionSettings.t() | nil,
          website: String.t() | nil
        }

  defstruct [
    :avatar_url,
    :customer_email_settings,
    :details,
    :email,
    :feature_settings,
    :name,
    :notification_settings,
    :socials,
    :subscription_settings,
    :website
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:union, [{:string, :uri}, :null]},
      customer_email_settings: {:union, [{Polarex.OrganizationCustomerEmailSettings, :t}, :null]},
      details: {:union, [{Polarex.OrganizationDetails, :t}, :null]},
      email: {:union, [{:string, :email}, :null]},
      feature_settings: {:union, [{Polarex.OrganizationFeatureSettings, :t}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      notification_settings: {:union, [{Polarex.OrganizationNotificationSettings, :t}, :null]},
      socials: {:union, [[{Polarex.OrganizationSocialLink, :t}], :null]},
      subscription_settings: {:union, [{Polarex.OrganizationSubscriptionSettings, :t}, :null]},
      website: {:union, [{:string, :uri}, :null]}
    ]
  end
end

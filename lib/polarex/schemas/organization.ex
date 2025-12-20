defmodule Polarex.Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """

  @type t :: %__MODULE__{
          allow_customer_updates: boolean,
          avatar_url: String.t() | nil,
          created_at: DateTime.t(),
          customer_email_settings: Polarex.OrganizationCustomerEmailSettings.t(),
          customer_portal_settings: Polarex.OrganizationCustomerPortalSettings.t(),
          details_submitted_at: DateTime.t() | nil,
          email: String.t() | nil,
          feature_settings: Polarex.OrganizationFeatureSettings.t() | nil,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          notification_settings: Polarex.OrganizationNotificationSettings.t(),
          proration_behavior: String.t(),
          slug: String.t(),
          socials: [Polarex.OrganizationSocialLink.t()],
          status: String.t(),
          subscription_settings: Polarex.OrganizationSubscriptionSettings.t(),
          website: String.t() | nil
        }

  defstruct [
    :allow_customer_updates,
    :avatar_url,
    :created_at,
    :customer_email_settings,
    :customer_portal_settings,
    :details_submitted_at,
    :email,
    :feature_settings,
    :id,
    :modified_at,
    :name,
    :notification_settings,
    :proration_behavior,
    :slug,
    :socials,
    :status,
    :subscription_settings,
    :website
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_customer_updates: :boolean,
      avatar_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      customer_email_settings: {Polarex.OrganizationCustomerEmailSettings, :t},
      customer_portal_settings: {Polarex.OrganizationCustomerPortalSettings, :t},
      details_submitted_at: {:union, [{:string, :date_time}, :null]},
      email: {:union, [{:string, :generic}, :null]},
      feature_settings: {:union, [{Polarex.OrganizationFeatureSettings, :t}, :null]},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      notification_settings: {Polarex.OrganizationNotificationSettings, :t},
      proration_behavior: {:enum, ["invoice", "prorate"]},
      slug: {:string, :generic},
      socials: [{Polarex.OrganizationSocialLink, :t}],
      status:
        {:enum,
         ["created", "onboarding_started", "initial_review", "ongoing_review", "denied", "active"]},
      subscription_settings: {Polarex.OrganizationSubscriptionSettings, :t},
      website: {:union, [{:string, :generic}, :null]}
    ]
  end
end

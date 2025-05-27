defmodule Polarex.Generated.OrganizationUpdate do
  @moduledoc """
  Provides struct and type for a OrganizationUpdate
  """

  @type t :: %__MODULE__{
          avatar_url: String.t() | nil,
          details: Polarex.Generated.OrganizationDetails.t() | nil,
          email: String.t() | nil,
          feature_settings: Polarex.Generated.OrganizationFeatureSettings.t() | nil,
          name: String.t() | nil,
          socials: [Polarex.Generated.OrganizationSocialLink.t()] | nil,
          subscription_settings: Polarex.Generated.OrganizationSubscriptionSettings.t() | nil,
          website: String.t() | nil
        }

  defstruct [
    :avatar_url,
    :details,
    :email,
    :feature_settings,
    :name,
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
      details: {:union, [{Polarex.Generated.OrganizationDetails, :t}, :null]},
      email: {:union, [{:string, :generic}, :null]},
      feature_settings: {:union, [{Polarex.Generated.OrganizationFeatureSettings, :t}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      socials: {:union, [[{Polarex.Generated.OrganizationSocialLink, :t}], :null]},
      subscription_settings:
        {:union, [{Polarex.Generated.OrganizationSubscriptionSettings, :t}, :null]},
      website: {:union, [{:string, :generic}, :null]}
    ]
  end
end

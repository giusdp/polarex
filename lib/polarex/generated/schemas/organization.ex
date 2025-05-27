defmodule Polarex.Generated.Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """

  @type t :: %__MODULE__{
          avatar_url: String.t() | nil,
          created_at: DateTime.t(),
          details_submitted_at: DateTime.t() | nil,
          email: String.t() | nil,
          feature_settings: Polarex.Generated.OrganizationFeatureSettings.t() | nil,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          slug: String.t(),
          socials: [Polarex.Generated.OrganizationSocialLink.t()],
          subscription_settings: Polarex.Generated.OrganizationSubscriptionSettings.t(),
          website: String.t() | nil
        }

  defstruct [
    :avatar_url,
    :created_at,
    :details_submitted_at,
    :email,
    :feature_settings,
    :id,
    :modified_at,
    :name,
    :slug,
    :socials,
    :subscription_settings,
    :website
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      details_submitted_at: {:union, [{:string, :date_time}, :null]},
      email: {:union, [{:string, :generic}, :null]},
      feature_settings: {:union, [{Polarex.Generated.OrganizationFeatureSettings, :t}, :null]},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      slug: {:string, :generic},
      socials: [{Polarex.Generated.OrganizationSocialLink, :t}],
      subscription_settings: {Polarex.Generated.OrganizationSubscriptionSettings, :t},
      website: {:union, [{:string, :generic}, :null]}
    ]
  end
end

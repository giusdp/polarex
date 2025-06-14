defmodule Polarex.AuthorizeResponseOrganization do
  @moduledoc """
  Provides struct and type for a AuthorizeResponseOrganization
  """

  @type t :: %__MODULE__{
          client: Polarex.OAuth2ClientPublic.t(),
          organizations: [Polarex.AuthorizeOrganization.t()],
          scopes: [String.t()],
          sub: Polarex.AuthorizeOrganization.t() | nil,
          sub_type: String.t()
        }

  defstruct [:client, :organizations, :scopes, :sub, :sub_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client: {Polarex.OAuth2ClientPublic, :t},
      organizations: [{Polarex.AuthorizeOrganization, :t}],
      scopes: [
        enum: [
          "openid",
          "profile",
          "email",
          "user:read",
          "admin",
          "web_default",
          "organizations:read",
          "organizations:write",
          "custom_fields:read",
          "custom_fields:write",
          "discounts:read",
          "discounts:write",
          "checkout_links:read",
          "checkout_links:write",
          "checkouts:read",
          "checkouts:write",
          "transactions:read",
          "transactions:write",
          "payouts:read",
          "payouts:write",
          "products:read",
          "products:write",
          "benefits:read",
          "benefits:write",
          "events:read",
          "events:write",
          "meters:read",
          "meters:write",
          "files:read",
          "files:write",
          "subscriptions:read",
          "subscriptions:write",
          "customers:read",
          "customers:write",
          "customer_meters:read",
          "customer_sessions:write",
          "orders:read",
          "orders:write",
          "refunds:read",
          "refunds:write",
          "payments:read",
          "metrics:read",
          "webhooks:read",
          "webhooks:write",
          "external_organizations:read",
          "license_keys:read",
          "license_keys:write",
          "repositories:read",
          "repositories:write",
          "issues:read",
          "issues:write",
          "customer_portal:read",
          "customer_portal:write",
          "notifications:read",
          "notifications:write",
          "notification_recipients:read",
          "notification_recipients:write"
        ]
      ],
      sub: {:union, [{Polarex.AuthorizeOrganization, :t}, :null]},
      sub_type: {:const, "organization"}
    ]
  end
end

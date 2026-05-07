defmodule Polarex.OrganizationAccessTokenCreate do
  @moduledoc """
  Provides struct and type for a OrganizationAccessTokenCreate
  """

  @type t :: %__MODULE__{
          comment: String.t(),
          expires_in: String.t() | nil,
          organization_id: String.t() | nil,
          scopes: [String.t()]
        }

  defstruct [:comment, :expires_in, :organization_id, :scopes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: :string,
      expires_in: {:union, [{:string, "duration"}, :null]},
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      scopes: [
        enum: [
          "openid",
          "profile",
          "email",
          "user:read",
          "user:write",
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
          "members:read",
          "members:write",
          "wallets:read",
          "wallets:write",
          "disputes:read",
          "customer_meters:read",
          "customer_sessions:write",
          "member_sessions:write",
          "customer_seats:read",
          "customer_seats:write",
          "orders:read",
          "orders:write",
          "refunds:read",
          "refunds:write",
          "payments:read",
          "metrics:read",
          "metrics:write",
          "webhooks:read",
          "webhooks:write",
          "license_keys:read",
          "license_keys:write",
          "customer_portal:read",
          "customer_portal:write",
          "notifications:read",
          "notifications:write",
          "notification_recipients:read",
          "notification_recipients:write",
          "organization_access_tokens:read",
          "organization_access_tokens:write"
        ]
      ]
    ]
  end
end

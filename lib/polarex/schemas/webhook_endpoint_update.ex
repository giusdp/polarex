defmodule Polarex.WebhookEndpointUpdate do
  @moduledoc """
  Provides struct and type for a WebhookEndpointUpdate
  """

  @type t :: %__MODULE__{
          enabled: boolean | nil,
          events: [String.t()] | nil,
          format: String.t() | nil,
          name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:enabled, :events, :format, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      enabled: {:union, [:boolean, :null]},
      events:
        {:union,
         [
           [
             enum: [
               "checkout.created",
               "checkout.updated",
               "checkout.expired",
               "customer.created",
               "customer.updated",
               "customer.deleted",
               "customer.state_changed",
               "customer_seat.assigned",
               "customer_seat.claimed",
               "customer_seat.revoked",
               "member.created",
               "member.updated",
               "member.deleted",
               "order.created",
               "order.updated",
               "order.paid",
               "order.refunded",
               "subscription.created",
               "subscription.updated",
               "subscription.active",
               "subscription.canceled",
               "subscription.uncanceled",
               "subscription.revoked",
               "subscription.past_due",
               "subscription.paused",
               "subscription.resumed",
               "refund.created",
               "refund.updated",
               "product.created",
               "product.updated",
               "benefit.created",
               "benefit.updated",
               "benefit_grant.created",
               "benefit_grant.cycled",
               "benefit_grant.updated",
               "benefit_grant.revoked",
               "organization.updated"
             ]
           ],
           :null
         ]},
      format: {:union, [{:enum, ["raw", "discord", "slack"]}, :null]},
      name: {:union, [:string, :null]},
      url: {:union, [{:string, "uri"}, :null]}
    ]
  end
end

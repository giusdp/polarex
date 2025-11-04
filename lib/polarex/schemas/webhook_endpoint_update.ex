defmodule Polarex.WebhookEndpointUpdate do
  @moduledoc """
  Provides struct and type for a WebhookEndpointUpdate
  """

  @type t :: %__MODULE__{
          enabled: boolean | nil,
          events: [String.t()] | nil,
          format: String.t() | nil,
          secret: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:enabled, :events, :format, :secret, :url]

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
               "customer.created",
               "customer.updated",
               "customer.deleted",
               "customer.state_changed",
               "customer_seat.assigned",
               "customer_seat.claimed",
               "customer_seat.revoked",
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
      secret: {:union, [{:string, :generic}, :null]},
      url: {:union, [{:string, :uri}, :null]}
    ]
  end
end

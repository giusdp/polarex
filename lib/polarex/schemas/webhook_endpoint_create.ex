defmodule Polarex.WebhookEndpointCreate do
  @moduledoc """
  Provides struct and type for a WebhookEndpointCreate
  """

  @type t :: %__MODULE__{
          events: [String.t()],
          format: String.t(),
          organization_id: String.t() | nil,
          secret: String.t() | nil,
          url: String.t()
        }

  defstruct [:events, :format, :organization_id, :secret, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      events: [
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
      format: {:enum, ["raw", "discord", "slack"]},
      organization_id: {:union, [{:string, :generic}, :null]},
      secret: {:union, [{:string, :generic}, :null]},
      url: {:string, :uri}
    ]
  end
end

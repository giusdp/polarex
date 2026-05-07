defmodule Polarex.WebhookEndpointCreate do
  @moduledoc """
  Provides struct and type for a WebhookEndpointCreate
  """

  @type t :: %__MODULE__{
          events: [String.t()],
          format: String.t(),
          name: String.t() | nil,
          organization_id: String.t() | nil,
          url: String.t()
        }

  defstruct [:events, :format, :name, :organization_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      events: [
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
      name: {:union, [:string, :null]},
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      url: {:string, "uri"}
    ]
  end
end

defmodule Polarex.WebhookEndpoint do
  @moduledoc """
  Provides struct and type for a WebhookEndpoint
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          enabled: boolean,
          events: [String.t()],
          format: String.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          secret: String.t(),
          url: String.t()
        }

  defstruct [
    :created_at,
    :enabled,
    :events,
    :format,
    :id,
    :modified_at,
    :organization_id,
    :secret,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      enabled: :boolean,
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
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      organization_id: {:string, :generic},
      secret: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end

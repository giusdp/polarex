defmodule Polarex.WebhookEvent do
  @moduledoc """
  Provides struct and type for a WebhookEvent
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          is_archived: boolean,
          last_http_code: integer | nil,
          modified_at: DateTime.t() | nil,
          payload: String.t() | nil,
          skipped: boolean,
          succeeded: boolean | nil,
          type: String.t()
        }

  defstruct [
    :created_at,
    :id,
    :is_archived,
    :last_http_code,
    :modified_at,
    :payload,
    :skipped,
    :succeeded,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: {:string, :generic},
      is_archived: :boolean,
      last_http_code: {:union, [:integer, :null]},
      modified_at: {:union, [{:string, :date_time}, :null]},
      payload: {:union, [{:string, :generic}, :null]},
      skipped: :boolean,
      succeeded: {:union, [:boolean, :null]},
      type:
        {:enum,
         [
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
         ]}
    ]
  end
end

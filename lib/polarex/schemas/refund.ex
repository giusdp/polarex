defmodule Polarex.Refund do
  @moduledoc """
  Provides struct and type for a Refund
  """

  @type t :: %__MODULE__{
          amount: integer,
          created_at: DateTime.t(),
          currency: String.t(),
          customer_id: String.t(),
          dispute: Polarex.RefundDispute.t() | nil,
          id: String.t(),
          metadata: map,
          modified_at: DateTime.t() | nil,
          order_id: String.t(),
          organization_id: String.t(),
          reason: String.t(),
          revoke_benefits: boolean,
          status: String.t(),
          subscription_id: String.t() | nil,
          tax_amount: integer
        }

  defstruct [
    :amount,
    :created_at,
    :currency,
    :customer_id,
    :dispute,
    :id,
    :metadata,
    :modified_at,
    :order_id,
    :organization_id,
    :reason,
    :revoke_benefits,
    :status,
    :subscription_id,
    :tax_amount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      created_at: {:string, "date-time"},
      currency: :string,
      customer_id: {:string, "uuid4"},
      dispute: {:union, [{Polarex.RefundDispute, :t}, :null]},
      id: {:string, "uuid4"},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      order_id: {:string, "uuid4"},
      organization_id: {:string, "uuid4"},
      reason:
        {:enum,
         [
           "duplicate",
           "fraudulent",
           "customer_request",
           "service_disruption",
           "satisfaction_guarantee",
           "dispute_prevention",
           "other"
         ]},
      revoke_benefits: :boolean,
      status: {:enum, ["pending", "succeeded", "failed", "canceled"]},
      subscription_id: {:union, [{:string, "uuid4"}, :null]},
      tax_amount: :integer
    ]
  end
end

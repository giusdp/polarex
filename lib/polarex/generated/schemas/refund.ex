defmodule Polarex.Generated.Refund do
  @moduledoc """
  Provides struct and type for a Refund
  """

  @type t :: %__MODULE__{
          amount: integer,
          created_at: DateTime.t(),
          currency: String.t(),
          customer_id: String.t(),
          id: String.t(),
          metadata: Polarex.Generated.Metadata.t(),
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
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      customer_id: {:string, :generic},
      id: {:string, :generic},
      metadata: {Polarex.Generated.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      order_id: {:string, :generic},
      organization_id: {:string, :generic},
      reason:
        {:enum,
         [
           "duplicate",
           "fraudulent",
           "customer_request",
           "service_disruption",
           "satisfaction_guarantee",
           "other"
         ]},
      revoke_benefits: :boolean,
      status: {:enum, ["pending", "succeeded", "failed", "canceled"]},
      subscription_id: {:union, [{:string, :generic}, :null]},
      tax_amount: :integer
    ]
  end
end

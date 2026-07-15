defmodule Polarex.Dispute do
  @moduledoc """
  Provides struct and type for a Dispute
  """

  @type t :: %__MODULE__{
          amount: integer,
          case_id: String.t() | nil,
          closed: boolean,
          created_at: DateTime.t(),
          currency: String.t(),
          customer: Polarex.DisputeCustomer.t(),
          evidence_due_by: DateTime.t() | nil,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          order_id: String.t(),
          past_due: boolean,
          payment_id: String.t(),
          reason: String.t() | nil,
          resolved: boolean,
          status: String.t(),
          tax_amount: integer
        }

  defstruct [
    :amount,
    :case_id,
    :closed,
    :created_at,
    :currency,
    :customer,
    :evidence_due_by,
    :id,
    :modified_at,
    :order_id,
    :past_due,
    :payment_id,
    :reason,
    :resolved,
    :status,
    :tax_amount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      case_id: {:union, [{:string, "uuid4"}, :null]},
      closed: :boolean,
      created_at: {:string, "date-time"},
      currency: :string,
      customer: {Polarex.DisputeCustomer, :t},
      evidence_due_by: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      order_id: {:string, "uuid4"},
      past_due: :boolean,
      payment_id: {:string, "uuid4"},
      reason: {:union, [:string, :null]},
      resolved: :boolean,
      status:
        {:enum, ["prevented", "early_warning", "needs_response", "under_review", "lost", "won"]},
      tax_amount: :integer
    ]
  end
end

defmodule Polarex.Dispute do
  @moduledoc """
  Provides struct and type for a Dispute
  """

  @type t :: %__MODULE__{
          amount: integer,
          closed: boolean,
          created_at: DateTime.t(),
          currency: String.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          order_id: String.t(),
          payment_id: String.t(),
          resolved: boolean,
          status: String.t(),
          tax_amount: integer
        }

  defstruct [
    :amount,
    :closed,
    :created_at,
    :currency,
    :id,
    :modified_at,
    :order_id,
    :payment_id,
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
      closed: :boolean,
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      order_id: {:string, :generic},
      payment_id: {:string, :generic},
      resolved: :boolean,
      status:
        {:enum, ["prevented", "early_warning", "needs_response", "under_review", "lost", "won"]},
      tax_amount: :integer
    ]
  end
end

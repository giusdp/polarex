defmodule Polarex.RefundCreate do
  @moduledoc """
  Provides struct and type for a RefundCreate
  """

  @type t :: %__MODULE__{
          amount: integer,
          comment: String.t() | nil,
          metadata: map | nil,
          order_id: String.t(),
          reason: String.t(),
          revoke_benefits: boolean | nil
        }

  defstruct [:amount, :comment, :metadata, :order_id, :reason, :revoke_benefits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      comment: {:union, [:string, :null]},
      metadata: :map,
      order_id: {:string, "uuid4"},
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
      revoke_benefits: :boolean
    ]
  end
end

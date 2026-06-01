defmodule Polarex.CustomerSeatAssign do
  @moduledoc """
  Provides struct and type for a CustomerSeatAssign
  """

  @type t :: %__MODULE__{
          checkout_id: String.t() | nil,
          customer_id: String.t() | nil,
          email: String.t() | nil,
          external_customer_id: String.t() | nil,
          external_member_id: String.t() | nil,
          immediate_claim: boolean | nil,
          member_id: String.t() | nil,
          metadata: map | nil,
          order_id: String.t() | nil,
          subscription_id: String.t() | nil
        }

  defstruct [
    :checkout_id,
    :customer_id,
    :email,
    :external_customer_id,
    :external_member_id,
    :immediate_claim,
    :member_id,
    :metadata,
    :order_id,
    :subscription_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkout_id: {:union, [{:string, "uuid"}, :null]},
      customer_id: {:union, [{:string, "uuid"}, :null]},
      email: {:union, [{:string, "email"}, :null]},
      external_customer_id: {:union, [:string, :null]},
      external_member_id: {:union, [:string, :null]},
      immediate_claim: :boolean,
      member_id: {:union, [{:string, "uuid"}, :null]},
      metadata: {:union, [:map, :null]},
      order_id: {:union, [{:string, "uuid"}, :null]},
      subscription_id: {:union, [{:string, "uuid"}, :null]}
    ]
  end
end

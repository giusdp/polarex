defmodule Polarex.CustomerSeat do
  @moduledoc """
  Provides struct and type for a CustomerSeat
  """

  @type t :: %__MODULE__{
          claimed_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          customer_email: String.t() | nil,
          customer_id: String.t() | nil,
          email: String.t() | nil,
          id: String.t(),
          invitation_token_expires_at: DateTime.t() | nil,
          member: Polarex.Member.t() | nil,
          member_id: String.t() | nil,
          modified_at: DateTime.t() | nil,
          order_id: String.t() | nil,
          revoked_at: DateTime.t() | nil,
          seat_metadata: map | nil,
          status: String.t(),
          subscription_id: String.t() | nil
        }

  defstruct [
    :claimed_at,
    :created_at,
    :customer_email,
    :customer_id,
    :email,
    :id,
    :invitation_token_expires_at,
    :member,
    :member_id,
    :modified_at,
    :order_id,
    :revoked_at,
    :seat_metadata,
    :status,
    :subscription_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      claimed_at: {:union, [{:string, "date-time"}, :null]},
      created_at: {:string, "date-time"},
      customer_email: {:union, [:string, :null]},
      customer_id: {:union, [{:string, "uuid"}, :null]},
      email: {:union, [:string, :null]},
      id: {:string, "uuid"},
      invitation_token_expires_at: {:union, [{:string, "date-time"}, :null]},
      member: {:union, [{Polarex.Member, :t}, :null]},
      member_id: {:union, [{:string, "uuid"}, :null]},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      order_id: {:union, [{:string, "uuid"}, :null]},
      revoked_at: {:union, [{:string, "date-time"}, :null]},
      seat_metadata: {:union, [:map, :null]},
      status: {:enum, ["pending", "claimed", "revoked"]},
      subscription_id: {:union, [{:string, "uuid"}, :null]}
    ]
  end
end

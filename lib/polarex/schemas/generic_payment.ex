defmodule Polarex.GenericPayment do
  @moduledoc """
  Provides struct and type for a GenericPayment
  """

  @type t :: %__MODULE__{
          amount: integer,
          checkout_id: String.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          decline_message: String.t() | nil,
          decline_reason: String.t() | nil,
          id: String.t(),
          method: String.t(),
          modified_at: DateTime.t() | nil,
          order_id: String.t() | nil,
          organization_id: String.t(),
          processor: String.t(),
          processor_metadata: map | nil,
          status: String.t()
        }

  defstruct [
    :amount,
    :checkout_id,
    :created_at,
    :currency,
    :decline_message,
    :decline_reason,
    :id,
    :method,
    :modified_at,
    :order_id,
    :organization_id,
    :processor,
    :processor_metadata,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      checkout_id: {:union, [{:string, "uuid4"}, :null]},
      created_at: {:string, "date-time"},
      currency: :string,
      decline_message: {:union, [:string, :null]},
      decline_reason: {:union, [:string, :null]},
      id: {:string, "uuid4"},
      method: :string,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      order_id: {:union, [{:string, "uuid4"}, :null]},
      organization_id: {:string, "uuid4"},
      processor: {:const, "stripe"},
      processor_metadata: :map,
      status: {:enum, ["pending", "succeeded", "failed"]}
    ]
  end
end

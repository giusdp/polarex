defmodule Polarex.Generated.GenericPayment do
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
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :integer,
      checkout_id: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      decline_message: {:union, [{:string, :generic}, :null]},
      decline_reason: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      method: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      order_id: {:union, [{:string, :generic}, :null]},
      organization_id: {:string, :generic},
      processor: {:const, "stripe"},
      status: {:enum, ["pending", "succeeded", "failed"]}
    ]
  end
end

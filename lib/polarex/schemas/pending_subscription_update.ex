defmodule Polarex.PendingSubscriptionUpdate do
  @moduledoc """
  Provides struct and type for a PendingSubscriptionUpdate
  """

  @type t :: %__MODULE__{
          applies_at: DateTime.t(),
          created_at: DateTime.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          product_id: String.t() | nil,
          seats: integer | nil
        }

  defstruct [:applies_at, :created_at, :id, :modified_at, :product_id, :seats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applies_at: {:string, "date-time"},
      created_at: {:string, "date-time"},
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      product_id: {:union, [{:string, "uuid4"}, :null]},
      seats: {:union, [:integer, :null]}
    ]
  end
end

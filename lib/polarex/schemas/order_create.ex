defmodule Polarex.OrderCreate do
  @moduledoc """
  Provides struct and type for a OrderCreate
  """

  @type t :: %__MODULE__{
          amount: integer | nil,
          currency: String.t() | nil,
          custom_field_data: map | nil,
          customer_id: String.t(),
          description: String.t() | nil,
          metadata: map | nil,
          organization_id: String.t() | nil,
          product_id: String.t()
        }

  defstruct [
    :amount,
    :currency,
    :custom_field_data,
    :customer_id,
    :description,
    :metadata,
    :organization_id,
    :product_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {:union, [:integer, :null]},
      currency: {:union, [:string, :null]},
      custom_field_data: :map,
      customer_id: {:string, "uuid4"},
      description: {:union, [:string, :null]},
      metadata: :map,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      product_id: {:string, "uuid4"}
    ]
  end
end

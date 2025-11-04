defmodule Polarex.SubscriptionCreateCustomer do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateCustomer
  """

  @type t :: %__MODULE__{
          customer_id: String.t(),
          metadata: Polarex.Metadata.t() | nil,
          product_id: String.t()
        }

  defstruct [:customer_id, :metadata, :product_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer_id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      product_id: {:string, :generic}
    ]
  end
end

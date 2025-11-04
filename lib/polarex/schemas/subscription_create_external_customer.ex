defmodule Polarex.SubscriptionCreateExternalCustomer do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateExternalCustomer
  """

  @type t :: %__MODULE__{
          external_customer_id: String.t(),
          metadata: Polarex.Metadata.t() | nil,
          product_id: String.t()
        }

  defstruct [:external_customer_id, :metadata, :product_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      product_id: {:string, :generic}
    ]
  end
end

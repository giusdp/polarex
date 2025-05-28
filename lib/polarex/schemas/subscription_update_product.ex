defmodule Polarex.SubscriptionUpdateProduct do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateProduct
  """

  @type t :: %__MODULE__{product_id: String.t(), proration_behavior: String.t() | nil}

  defstruct [:product_id, :proration_behavior]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      product_id: {:string, :generic},
      proration_behavior: {:union, [{:enum, ["invoice", "prorate"]}, :null]}
    ]
  end
end

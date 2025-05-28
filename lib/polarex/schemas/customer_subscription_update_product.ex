defmodule Polarex.CustomerSubscriptionUpdateProduct do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionUpdateProduct
  """

  @type t :: %__MODULE__{product_id: String.t()}

  defstruct [:product_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [product_id: {:string, :generic}]
  end
end

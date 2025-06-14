defmodule Polarex.SubscriptionUpdateDiscount do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateDiscount
  """

  @type t :: %__MODULE__{discount_id: String.t() | nil}

  defstruct [:discount_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [discount_id: {:union, [{:string, :generic}, :null]}]
  end
end

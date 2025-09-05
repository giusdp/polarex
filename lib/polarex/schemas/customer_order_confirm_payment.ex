defmodule Polarex.CustomerOrderConfirmPayment do
  @moduledoc """
  Provides struct and type for a CustomerOrderConfirmPayment
  """

  @type t :: %__MODULE__{
          confirmation_token_id: String.t() | nil,
          payment_method_id: String.t() | nil,
          payment_processor: String.t() | nil
        }

  defstruct [:confirmation_token_id, :payment_method_id, :payment_processor]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      confirmation_token_id: {:union, [{:string, :generic}, :null]},
      payment_method_id: {:union, [{:string, :generic}, :null]},
      payment_processor: {:const, "stripe"}
    ]
  end
end

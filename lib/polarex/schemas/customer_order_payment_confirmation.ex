defmodule Polarex.CustomerOrderPaymentConfirmation do
  @moduledoc """
  Provides struct and type for a CustomerOrderPaymentConfirmation
  """

  @type t :: %__MODULE__{
          client_secret: String.t() | nil,
          error: String.t() | nil,
          status: String.t()
        }

  defstruct [:client_secret, :error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_secret: {:union, [{:string, :generic}, :null]},
      error: {:union, [{:string, :generic}, :null]},
      status: {:string, :generic}
    ]
  end
end

defmodule Polarex.CustomerOrderPaymentStatus do
  @moduledoc """
  Provides struct and type for a CustomerOrderPaymentStatus
  """

  @type t :: %__MODULE__{error: String.t() | nil, status: String.t()}

  defstruct [:error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: {:union, [{:string, :generic}, :null]}, status: {:string, :generic}]
  end
end

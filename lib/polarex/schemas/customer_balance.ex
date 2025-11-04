defmodule Polarex.CustomerBalance do
  @moduledoc """
  Provides struct and type for a CustomerBalance
  """

  @type t :: %__MODULE__{balance: integer, currency: String.t()}

  defstruct [:balance, :currency]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [balance: :integer, currency: {:string, :generic}]
  end
end

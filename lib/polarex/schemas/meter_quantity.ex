defmodule Polarex.MeterQuantity do
  @moduledoc """
  Provides struct and type for a MeterQuantity
  """

  @type t :: %__MODULE__{quantity: number, timestamp: DateTime.t()}

  defstruct [:quantity, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [quantity: :number, timestamp: {:string, :date_time}]
  end
end

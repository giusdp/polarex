defmodule Polarex.OrderInvoice do
  @moduledoc """
  Provides struct and type for a OrderInvoice
  """

  @type t :: %__MODULE__{url: String.t()}

  defstruct [:url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [url: {:string, :generic}]
  end
end

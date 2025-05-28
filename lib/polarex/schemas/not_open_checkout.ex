defmodule Polarex.NotOpenCheckout do
  @moduledoc """
  Provides struct and type for a NotOpenCheckout
  """

  @type t :: %__MODULE__{detail: String.t(), error: String.t()}

  defstruct [:detail, :error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [detail: {:string, :generic}, error: {:const, "NotOpenCheckout"}]
  end
end

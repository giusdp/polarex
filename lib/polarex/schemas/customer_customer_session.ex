defmodule Polarex.CustomerCustomerSession do
  @moduledoc """
  Provides struct and type for a CustomerCustomerSession
  """

  @type t :: %__MODULE__{expires_at: DateTime.t(), return_url: String.t() | nil}

  defstruct [:expires_at, :return_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expires_at: {:string, "date-time"}, return_url: {:union, [:string, :null]}]
  end
end

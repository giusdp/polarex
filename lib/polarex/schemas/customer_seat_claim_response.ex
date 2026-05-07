defmodule Polarex.CustomerSeatClaimResponse do
  @moduledoc """
  Provides struct and type for a CustomerSeatClaimResponse
  """

  @type t :: %__MODULE__{customer_session_token: String.t(), seat: Polarex.CustomerSeat.t()}

  defstruct [:customer_session_token, :seat]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_session_token: :string, seat: {Polarex.CustomerSeat, :t}]
  end
end

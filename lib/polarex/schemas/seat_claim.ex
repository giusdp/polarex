defmodule Polarex.SeatClaim do
  @moduledoc """
  Provides struct and type for a SeatClaim
  """

  @type t :: %__MODULE__{invitation_token: String.t()}

  defstruct [:invitation_token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invitation_token: {:string, :generic}]
  end
end

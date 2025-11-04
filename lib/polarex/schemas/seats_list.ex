defmodule Polarex.SeatsList do
  @moduledoc """
  Provides struct and type for a SeatsList
  """

  @type t :: %__MODULE__{
          available_seats: integer,
          seats: [Polarex.CustomerSeat.t()],
          total_seats: integer
        }

  defstruct [:available_seats, :seats, :total_seats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [available_seats: :integer, seats: [{Polarex.CustomerSeat, :t}], total_seats: :integer]
  end
end

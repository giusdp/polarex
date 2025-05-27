defmodule Polarex.Generated.EventsIngestResponse do
  @moduledoc """
  Provides struct and type for a EventsIngestResponse
  """

  @type t :: %__MODULE__{inserted: integer}

  defstruct [:inserted]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [inserted: :integer]
  end
end

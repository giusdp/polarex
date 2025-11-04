defmodule Polarex.EventsIngestResponse do
  @moduledoc """
  Provides struct and type for a EventsIngestResponse
  """

  @type t :: %__MODULE__{duplicates: integer | nil, inserted: integer}

  defstruct [:duplicates, :inserted]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [duplicates: :integer, inserted: :integer]
  end
end

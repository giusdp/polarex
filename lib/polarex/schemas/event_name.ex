defmodule Polarex.EventName do
  @moduledoc """
  Provides struct and type for a EventName
  """

  @type t :: %__MODULE__{
          first_seen: DateTime.t(),
          label: String.t(),
          last_seen: DateTime.t(),
          name: String.t(),
          occurrences: integer,
          source: String.t()
        }

  defstruct [:first_seen, :label, :last_seen, :name, :occurrences, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      first_seen: {:string, "date-time"},
      label: :string,
      last_seen: {:string, "date-time"},
      name: :string,
      occurrences: :integer,
      source: {:enum, ["system", "user"]}
    ]
  end
end

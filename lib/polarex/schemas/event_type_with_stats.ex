defmodule Polarex.EventTypeWithStats do
  @moduledoc """
  Provides struct and type for a EventTypeWithStats
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          first_seen: DateTime.t(),
          id: String.t(),
          label: String.t(),
          label_property_selector: String.t() | nil,
          last_seen: DateTime.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          occurrences: integer,
          organization_id: String.t(),
          source: String.t()
        }

  defstruct [
    :created_at,
    :first_seen,
    :id,
    :label,
    :label_property_selector,
    :last_seen,
    :modified_at,
    :name,
    :occurrences,
    :organization_id,
    :source
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      first_seen: {:string, :date_time},
      id: {:string, :generic},
      label: {:string, :generic},
      label_property_selector: {:union, [{:string, :generic}, :null]},
      last_seen: {:string, :date_time},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      occurrences: :integer,
      organization_id: {:string, :generic},
      source: {:enum, ["system", "user"]}
    ]
  end
end

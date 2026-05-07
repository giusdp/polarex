defmodule Polarex.EventType do
  @moduledoc """
  Provides struct and type for a EventType
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          label: String.t(),
          label_property_selector: String.t() | nil,
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t()
        }

  defstruct [
    :created_at,
    :id,
    :label,
    :label_property_selector,
    :modified_at,
    :name,
    :organization_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      id: {:string, "uuid4"},
      label: :string,
      label_property_selector: {:union, [:string, :null]},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"}
    ]
  end
end

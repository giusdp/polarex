defmodule Polarex.CustomFieldDate do
  @moduledoc """
  Provides struct and type for a CustomFieldDate
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          properties: Polarex.CustomFieldDateProperties.t(),
          slug: String.t(),
          type: String.t()
        }

  defstruct [
    :created_at,
    :id,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :properties,
    :slug,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      id: {:string, "uuid4"},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"},
      properties: {Polarex.CustomFieldDateProperties, :t},
      slug: :string,
      type: {:const, "date"}
    ]
  end
end

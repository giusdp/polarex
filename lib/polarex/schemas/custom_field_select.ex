defmodule Polarex.CustomFieldSelect do
  @moduledoc """
  Provides struct and type for a CustomFieldSelect
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          metadata: Polarex.Metadata.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          properties: Polarex.CustomFieldSelectProperties.t(),
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
      created_at: {:string, :date_time},
      id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      properties: {Polarex.CustomFieldSelectProperties, :t},
      slug: {:string, :generic},
      type: {:const, "select"}
    ]
  end
end

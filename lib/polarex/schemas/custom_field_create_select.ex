defmodule Polarex.CustomFieldCreateSelect do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateSelect
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          properties: Polarex.CustomFieldSelectProperties.t(),
          slug: String.t(),
          type: String.t()
        }

  defstruct [:metadata, :name, :organization_id, :properties, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: :map,
      name: :string,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      properties: {Polarex.CustomFieldSelectProperties, :t},
      slug: :string,
      type: {:const, "select"}
    ]
  end
end

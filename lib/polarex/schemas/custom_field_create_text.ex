defmodule Polarex.CustomFieldCreateText do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateText
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          properties: Polarex.CustomFieldTextProperties.t(),
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
      properties: {Polarex.CustomFieldTextProperties, :t},
      slug: :string,
      type: {:const, "text"}
    ]
  end
end

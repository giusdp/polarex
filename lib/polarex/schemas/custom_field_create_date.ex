defmodule Polarex.CustomFieldCreateDate do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateDate
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          properties: Polarex.CustomFieldDateProperties.t(),
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
      properties: {Polarex.CustomFieldDateProperties, :t},
      slug: :string,
      type: {:const, "date"}
    ]
  end
end

defmodule Polarex.Generated.CustomFieldCreateNumber do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateNumber
  """

  @type t :: %__MODULE__{
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          properties: Polarex.Generated.CustomFieldNumberProperties.t(),
          slug: String.t(),
          type: String.t()
        }

  defstruct [:metadata, :name, :organization_id, :properties, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      properties: {Polarex.Generated.CustomFieldNumberProperties, :t},
      slug: {:string, :generic},
      type: {:const, "number"}
    ]
  end
end

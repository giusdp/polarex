defmodule Polarex.CustomFieldCreateDate do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateDate
  """

  @type t :: %__MODULE__{
          metadata: Polarex.Metadata.t() | nil,
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
      metadata: {Polarex.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      properties: {Polarex.CustomFieldDateProperties, :t},
      slug: {:string, :generic},
      type: {:const, "date"}
    ]
  end
end

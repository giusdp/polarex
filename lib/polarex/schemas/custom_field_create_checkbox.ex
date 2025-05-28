defmodule Polarex.CustomFieldCreateCheckbox do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateCheckbox
  """

  @type t :: %__MODULE__{
          metadata: Polarex.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          properties: Polarex.CustomFieldCheckboxProperties.t(),
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
      properties: {Polarex.CustomFieldCheckboxProperties, :t},
      slug: {:string, :generic},
      type: {:const, "checkbox"}
    ]
  end
end

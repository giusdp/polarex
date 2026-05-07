defmodule Polarex.CustomFieldUpdateCheckbox do
  @moduledoc """
  Provides struct and type for a CustomFieldUpdateCheckbox
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          name: String.t() | nil,
          properties: Polarex.CustomFieldCheckboxProperties.t() | nil,
          slug: String.t() | nil,
          type: String.t()
        }

  defstruct [:metadata, :name, :properties, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: :map,
      name: {:union, [:string, :null]},
      properties: {:union, [{Polarex.CustomFieldCheckboxProperties, :t}, :null]},
      slug: {:union, [:string, :null]},
      type: {:const, "checkbox"}
    ]
  end
end

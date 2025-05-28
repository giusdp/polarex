defmodule Polarex.CustomFieldUpdateSelect do
  @moduledoc """
  Provides struct and type for a CustomFieldUpdateSelect
  """

  @type t :: %__MODULE__{
          metadata: Polarex.Metadata.t() | nil,
          name: String.t() | nil,
          properties: Polarex.CustomFieldSelectProperties.t() | nil,
          slug: String.t() | nil,
          type: String.t()
        }

  defstruct [:metadata, :name, :properties, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: {Polarex.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]},
      properties: {:union, [{Polarex.CustomFieldSelectProperties, :t}, :null]},
      slug: {:union, [{:string, :generic}, :null]},
      type: {:const, "select"}
    ]
  end
end

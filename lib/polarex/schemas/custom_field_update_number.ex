defmodule Polarex.CustomFieldUpdateNumber do
  @moduledoc """
  Provides struct and type for a CustomFieldUpdateNumber
  """

  @type t :: %__MODULE__{
          metadata: Polarex.Metadata.t() | nil,
          name: String.t() | nil,
          properties: Polarex.CustomFieldNumberProperties.t() | nil,
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
      properties: {:union, [{Polarex.CustomFieldNumberProperties, :t}, :null]},
      slug: {:union, [{:string, :generic}, :null]},
      type: {:const, "number"}
    ]
  end
end

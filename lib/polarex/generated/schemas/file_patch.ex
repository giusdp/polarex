defmodule Polarex.Generated.FilePatch do
  @moduledoc """
  Provides struct and type for a FilePatch
  """

  @type t :: %__MODULE__{name: String.t() | nil, version: String.t() | nil}

  defstruct [:name, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:union, [{:string, :generic}, :null]},
      version: {:union, [{:string, :generic}, :null]}
    ]
  end
end

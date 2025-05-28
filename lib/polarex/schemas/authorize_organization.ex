defmodule Polarex.AuthorizeOrganization do
  @moduledoc """
  Provides struct and type for a AuthorizeOrganization
  """

  @type t :: %__MODULE__{avatar_url: String.t() | nil, id: String.t(), slug: String.t()}

  defstruct [:avatar_url, :id, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      slug: {:string, :generic}
    ]
  end
end

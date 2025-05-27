defmodule Polarex.Generated.AuthorizeUser do
  @moduledoc """
  Provides struct and type for a AuthorizeUser
  """

  @type t :: %__MODULE__{avatar_url: String.t() | nil, email: String.t(), id: String.t()}

  defstruct [:avatar_url, :email, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:union, [{:string, :generic}, :null]},
      email: {:string, :email},
      id: {:string, :generic}
    ]
  end
end

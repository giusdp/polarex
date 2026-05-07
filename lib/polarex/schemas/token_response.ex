defmodule Polarex.TokenResponse do
  @moduledoc """
  Provides struct and type for a TokenResponse
  """

  @type t :: %__MODULE__{
          access_token: String.t(),
          expires_in: integer,
          id_token: String.t() | nil,
          refresh_token: String.t() | nil,
          scope: String.t(),
          token_type: String.t()
        }

  defstruct [:access_token, :expires_in, :id_token, :refresh_token, :scope, :token_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_token: :string,
      expires_in: :integer,
      id_token: {:union, [:string, :null]},
      refresh_token: {:union, [:string, :null]},
      scope: :string,
      token_type: {:const, "Bearer"}
    ]
  end
end

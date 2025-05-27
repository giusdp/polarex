defmodule Polarex.Generated.IntrospectTokenResponse do
  @moduledoc """
  Provides struct and type for a IntrospectTokenResponse
  """

  @type t :: %__MODULE__{
          active: boolean,
          aud: String.t(),
          client_id: String.t(),
          exp: integer,
          iat: integer,
          iss: String.t(),
          scope: String.t(),
          sub: String.t(),
          sub_type: String.t(),
          token_type: String.t()
        }

  defstruct [:active, :aud, :client_id, :exp, :iat, :iss, :scope, :sub, :sub_type, :token_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active: :boolean,
      aud: {:string, :generic},
      client_id: {:string, :generic},
      exp: :integer,
      iat: :integer,
      iss: {:string, :generic},
      scope: {:string, :generic},
      sub: {:string, :generic},
      sub_type: {:enum, ["user", "organization"]},
      token_type: {:enum, ["access_token", "refresh_token"]}
    ]
  end
end

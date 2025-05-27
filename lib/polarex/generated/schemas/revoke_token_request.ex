defmodule Polarex.Generated.RevokeTokenRequest do
  @moduledoc """
  Provides struct and type for a RevokeTokenRequest
  """

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_secret: String.t(),
          token: String.t(),
          token_type_hint: String.t() | nil
        }

  defstruct [:client_id, :client_secret, :token, :token_type_hint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      token: {:string, :generic},
      token_type_hint: {:union, [{:enum, ["access_token", "refresh_token"]}, :null]}
    ]
  end
end

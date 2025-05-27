defmodule Polarex.Generated.AuthorizationCodeTokenRequest do
  @moduledoc """
  Provides struct and type for a AuthorizationCodeTokenRequest
  """

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_secret: String.t(),
          code: String.t(),
          grant_type: String.t(),
          redirect_uri: String.t()
        }

  defstruct [:client_id, :client_secret, :code, :grant_type, :redirect_uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      code: {:string, :generic},
      grant_type: {:const, "authorization_code"},
      redirect_uri: {:string, :uri}
    ]
  end
end

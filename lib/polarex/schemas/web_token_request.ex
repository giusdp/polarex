defmodule Polarex.WebTokenRequest do
  @moduledoc """
  Provides struct and type for a WebTokenRequest
  """

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_secret: String.t(),
          grant_type: String.t(),
          scope: String.t() | nil,
          session_token: String.t(),
          sub: String.t() | nil,
          sub_type: String.t() | nil
        }

  defstruct [:client_id, :client_secret, :grant_type, :scope, :session_token, :sub, :sub_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      grant_type: {:const, "web"},
      scope: {:union, [{:string, :generic}, :null]},
      session_token: {:string, :generic},
      sub: {:union, [{:string, :generic}, :null]},
      sub_type: {:enum, ["user", "organization"]}
    ]
  end
end

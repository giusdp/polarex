defmodule Polarex.OAuth2ClientConfigurationUpdate do
  @moduledoc """
  Provides struct and type for a OAuth2ClientConfigurationUpdate
  """

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_name: String.t(),
          client_uri: String.t() | nil,
          grant_types: [String.t()] | nil,
          logo_uri: String.t() | nil,
          policy_uri: String.t() | nil,
          redirect_uris: [String.t()],
          response_types: [String.t()] | nil,
          scope: String.t() | nil,
          token_endpoint_auth_method: String.t() | nil,
          tos_uri: String.t() | nil
        }

  defstruct [
    :client_id,
    :client_name,
    :client_uri,
    :grant_types,
    :logo_uri,
    :policy_uri,
    :redirect_uris,
    :response_types,
    :scope,
    :token_endpoint_auth_method,
    :tos_uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_name: {:string, :generic},
      client_uri: {:union, [{:string, :generic}, :null]},
      grant_types: [enum: ["authorization_code", "refresh_token"]],
      logo_uri: {:union, [{:string, :uri}, :null]},
      policy_uri: {:union, [{:string, :uri}, :null]},
      redirect_uris: [string: :uri],
      response_types: [const: "code"],
      scope: {:string, :generic},
      token_endpoint_auth_method: {:enum, ["client_secret_basic", "client_secret_post", "none"]},
      tos_uri: {:union, [{:string, :uri}, :null]}
    ]
  end
end

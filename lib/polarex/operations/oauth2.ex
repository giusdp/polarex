defmodule Polarex.Oauth2 do
  @moduledoc """
  Provides API endpoints related to oauth2
  """

  @default_client Polarex.Support.Client

  @doc """
  Authorize
  """
  @spec oauth2_authorize(opts :: keyword) ::
          {:ok, Polarex.AuthorizeResponseOrganization.t() | Polarex.AuthorizeResponseUser.t()}
          | :error
  def oauth2_authorize(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Oauth2, :oauth2_authorize},
      url: "/v1/oauth2/authorize",
      method: :get,
      response: [
        {200,
         {:union,
          [{Polarex.AuthorizeResponseOrganization, :t}, {Polarex.AuthorizeResponseUser, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client

  Create an OAuth2 client.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec oauth2_clients_oauth2_create_client(
          body :: Polarex.OAuth2ClientConfiguration.t(),
          opts :: keyword
        ) :: {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_create_client(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Oauth2, :oauth2_clients_oauth2_create_client},
      url: "/v1/oauth2/register",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.OAuth2ClientConfiguration, :t}}],
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Client

  Delete an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_delete_client(client_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_delete_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Oauth2, :oauth2_clients_oauth2_delete_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :delete,
      response: [{204, :null}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Client

  Get an OAuth2 client by Client ID.
  """
  @spec oauth2_clients_oauth2_get_client(client_id :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_get_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Oauth2, :oauth2_clients_oauth2_get_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :get,
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update Client

  Update an OAuth2 client.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec oauth2_clients_oauth2_update_client(
          client_id :: String.t(),
          body :: Polarex.OAuth2ClientConfigurationUpdate.t(),
          opts :: keyword
        ) :: {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_update_client(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {Polarex.Oauth2, :oauth2_clients_oauth2_update_client},
      url: "/v1/oauth2/register/#{client_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Polarex.OAuth2ClientConfigurationUpdate, :t}}],
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Introspect Token

  Get information about an access token.

  ## Request Body

  **Content Types**: `application/x-www-form-urlencoded`
  """
  @spec oauth2_introspect_token(body :: Polarex.IntrospectTokenRequest.t(), opts :: keyword) ::
          {:ok, Polarex.IntrospectTokenResponse.t()} | :error
  def oauth2_introspect_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Oauth2, :oauth2_introspect_token},
      url: "/v1/oauth2/introspect",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", {Polarex.IntrospectTokenRequest, :t}}],
      response: [{200, {Polarex.IntrospectTokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Request Token

  Request an access token using a valid grant.

  ## Request Body

  **Content Types**: `application/x-www-form-urlencoded`
  """
  @spec oauth2_request_token(
          body ::
            Polarex.AuthorizationCodeTokenRequest.t()
            | Polarex.RefreshTokenRequest.t()
            | Polarex.WebTokenRequest.t(),
          opts :: keyword
        ) :: {:ok, Polarex.TokenResponse.t()} | :error
  def oauth2_request_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Oauth2, :oauth2_request_token},
      url: "/v1/oauth2/token",
      body: body,
      method: :post,
      request: [
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {Polarex.AuthorizationCodeTokenRequest, :t},
            {Polarex.RefreshTokenRequest, :t},
            {Polarex.WebTokenRequest, :t}
          ]}}
      ],
      response: [{200, {Polarex.TokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Revoke Token

  Revoke an access token or a refresh token.

  ## Request Body

  **Content Types**: `application/x-www-form-urlencoded`
  """
  @spec oauth2_revoke_token(body :: Polarex.RevokeTokenRequest.t(), opts :: keyword) ::
          {:ok, map} | :error
  def oauth2_revoke_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Oauth2, :oauth2_revoke_token},
      url: "/v1/oauth2/revoke",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", {Polarex.RevokeTokenRequest, :t}}],
      response: [{200, :map}],
      opts: opts
    })
  end

  @doc """
  Get User Info

  Get information about the authenticated user.
  """
  @spec oauth2_userinfo(opts :: keyword) ::
          {:ok, Polarex.UserInfoOrganization.t() | Polarex.UserInfoUser.t()} | :error
  def oauth2_userinfo(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.Oauth2, :oauth2_userinfo},
      url: "/v1/oauth2/userinfo",
      method: :get,
      response: [
        {200, {:union, [{Polarex.UserInfoOrganization, :t}, {Polarex.UserInfoUser, :t}]}}
      ],
      opts: opts
    })
  end
end

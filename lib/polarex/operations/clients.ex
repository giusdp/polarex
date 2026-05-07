defmodule Polarex.Clients do
  @moduledoc """
  Provides API endpoints related to clients
  """

  @default_client Polarex.Support.Client

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
      call: {Polarex.Clients, :oauth2_clients_oauth2_create_client},
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
          {:ok, map} | {:error, Polarex.HTTPValidationError.t()}
  def oauth2_clients_oauth2_delete_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Clients, :oauth2_clients_oauth2_delete_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :delete,
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
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
      call: {Polarex.Clients, :oauth2_clients_oauth2_get_client},
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
      call: {Polarex.Clients, :oauth2_clients_oauth2_update_client},
      url: "/v1/oauth2/register/#{client_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Polarex.OAuth2ClientConfigurationUpdate, :t}}],
      response: [{200, :map}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end
end

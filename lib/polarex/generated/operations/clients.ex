defmodule Polarex.Generated.Clients do
  @moduledoc """
  Provides API endpoints related to clients
  """

  @default_client Polarex.Support.Client

  @doc """
  List Clients

  List OAuth2 clients.

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec oauth2_clients_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceOAuth2Client.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Clients, :oauth2_clients_list},
      url: "/v1/oauth2/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceOAuth2Client, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client

  Create an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_create_client(
          Polarex.Generated.OAuth2ClientConfiguration.t(),
          keyword
        ) :: {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_create_client(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Clients, :oauth2_clients_oauth2_create_client},
      url: "/v1/oauth2/register",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.OAuth2ClientConfiguration, :t}}],
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Client

  Delete an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_delete_client(String.t(), keyword) ::
          {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_delete_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Generated.Clients, :oauth2_clients_oauth2_delete_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :delete,
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Client

  Get an OAuth2 client by Client ID.
  """
  @spec oauth2_clients_oauth2_get_client(String.t(), keyword) ::
          {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_get_client(client_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id],
      call: {Polarex.Generated.Clients, :oauth2_clients_oauth2_get_client},
      url: "/v1/oauth2/register/#{client_id}",
      method: :get,
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update Client

  Update an OAuth2 client.
  """
  @spec oauth2_clients_oauth2_update_client(
          String.t(),
          Polarex.Generated.OAuth2ClientConfigurationUpdate.t(),
          keyword
        ) :: {:ok, map} | {:error, Polarex.Generated.HTTPValidationError.t()}
  def oauth2_clients_oauth2_update_client(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {Polarex.Generated.Clients, :oauth2_clients_oauth2_update_client},
      url: "/v1/oauth2/register/#{client_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Polarex.Generated.OAuth2ClientConfigurationUpdate, :t}}],
      response: [{200, :map}, {422, {Polarex.Generated.HTTPValidationError, :t}}],
      opts: opts
    })
  end
end

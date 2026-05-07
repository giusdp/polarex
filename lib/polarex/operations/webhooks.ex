defmodule Polarex.Webhooks do
  @moduledoc """
  Provides API endpoints related to webhooks
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Webhook Endpoint

  Create a webhook endpoint.

  **Scopes**: `webhooks:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec webhooks_create_webhook_endpoint(
          body :: Polarex.WebhookEndpointCreate.t(),
          opts :: keyword
        ) :: {:ok, Polarex.WebhookEndpoint.t()} | {:error, Polarex.HTTPValidationError.t()}
  def webhooks_create_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Webhooks, :webhooks_create_webhook_endpoint},
      url: "/v1/webhooks/endpoints",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.WebhookEndpointCreate, :t}}],
      response: [{201, {Polarex.WebhookEndpoint, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete Webhook Endpoint

  Delete a webhook endpoint.

  **Scopes**: `webhooks:write`
  """
  @spec webhooks_delete_webhook_endpoint(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_delete_webhook_endpoint(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Webhooks, :webhooks_delete_webhook_endpoint},
      url: "/v1/webhooks/endpoints/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Webhook Endpoint

  Get a webhook endpoint by ID.

  **Scopes**: `webhooks:read` `webhooks:write`
  """
  @spec webhooks_get_webhook_endpoint(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.WebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_get_webhook_endpoint(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Webhooks, :webhooks_get_webhook_endpoint},
      url: "/v1/webhooks/endpoints/#{id}",
      method: :get,
      response: [
        {200, {Polarex.WebhookEndpoint, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Webhook Deliveries

  List webhook deliveries.

  Deliveries are all the attempts to deliver a webhook event to an endpoint.

  **Scopes**: `webhooks:read` `webhooks:write`

  ## Options

    * `endpoint_id`: Filter by webhook endpoint ID.
    * `start_timestamp`: Filter deliveries after this timestamp.
    * `end_timestamp`: Filter deliveries before this timestamp.
    * `succeeded`: Filter by delivery success status.
    * `query`: Query to filter webhook deliveries.
    * `http_code_class`: Filter by HTTP response code class (2xx, 3xx, 4xx, 5xx).
    * `event_type`: Filter by webhook event type.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec webhooks_list_webhook_deliveries(opts :: keyword) ::
          {:ok, Polarex.ListResourceWebhookDelivery.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def webhooks_list_webhook_deliveries(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :end_timestamp,
        :endpoint_id,
        :event_type,
        :http_code_class,
        :limit,
        :page,
        :query,
        :start_timestamp,
        :succeeded
      ])

    client.request(%{
      args: [],
      call: {Polarex.Webhooks, :webhooks_list_webhook_deliveries},
      url: "/v1/webhooks/deliveries",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceWebhookDelivery, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Webhook Endpoints

  List webhook endpoints.

  **Scopes**: `webhooks:read` `webhooks:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec webhooks_list_webhook_endpoints(opts :: keyword) ::
          {:ok, Polarex.ListResourceWebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def webhooks_list_webhook_endpoints(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Webhooks, :webhooks_list_webhook_endpoints},
      url: "/v1/webhooks/endpoints",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceWebhookEndpoint, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Redeliver Webhook Event

  Schedule the re-delivery of a webhook event.

  **Scopes**: `webhooks:write`
  """
  @spec webhooks_redeliver_webhook_event(id :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_redeliver_webhook_event(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Webhooks, :webhooks_redeliver_webhook_event},
      url: "/v1/webhooks/events/#{id}/redeliver",
      method: :post,
      response: [
        {202, :map},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset Webhook Endpoint Secret

  Regenerate a webhook endpoint secret.

  **Scopes**: `webhooks:write`
  """
  @spec webhooks_reset_webhook_endpoint_secret(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.WebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_reset_webhook_endpoint_secret(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Webhooks, :webhooks_reset_webhook_endpoint_secret},
      url: "/v1/webhooks/endpoints/#{id}/secret",
      method: :patch,
      response: [
        {200, {Polarex.WebhookEndpoint, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Webhook Endpoint

  Update a webhook endpoint.

  **Scopes**: `webhooks:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec webhooks_update_webhook_endpoint(
          id :: String.t(),
          body :: Polarex.WebhookEndpointUpdate.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.WebhookEndpoint.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def webhooks_update_webhook_endpoint(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Webhooks, :webhooks_update_webhook_endpoint},
      url: "/v1/webhooks/endpoints/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.WebhookEndpointUpdate, :t}}],
      response: [
        {200, {Polarex.WebhookEndpoint, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

defmodule Polarex.Generated.Events do
  @moduledoc """
  Provides API endpoints related to events
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Event

  Get an event by ID.

  **Scopes**: `events:read` `events:write`
  """
  @spec events_get(String.t(), keyword) ::
          {:ok, map | Polarex.Generated.UserEvent.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def events_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Events, :events_get},
      url: "/v1/events/#{id}",
      method: :get,
      response: [
        {200, {:union, [:map, {Polarex.Generated.UserEvent, :t}]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Ingest Events

  Ingest batch of events.

  **Scopes**: `events:write`
  """
  @spec events_ingest(Polarex.Generated.EventsIngest.t(), keyword) ::
          {:ok, Polarex.Generated.EventsIngestResponse.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def events_ingest(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Events, :events_ingest},
      url: "/v1/events/ingest",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.EventsIngest, :t}}],
      response: [
        {200, {Polarex.Generated.EventsIngestResponse, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Events

  List events.

  **Scopes**: `events:read` `events:write`

  ## Options

    * `filter`: Filter events following filter clauses. JSON string following the same schema a meter filter clause. 
    * `start_timestamp`: Filter events after this timestamp.
    * `end_timestamp`: Filter events before this timestamp.
    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `meter_id`: Filter by a meter filter clause.
    * `name`: Filter by event name.
    * `source`: Filter by event source.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec events_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceEvent.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def events_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :end_timestamp,
        :external_customer_id,
        :filter,
        :limit,
        :metadata,
        :meter_id,
        :name,
        :organization_id,
        :page,
        :sorting,
        :source,
        :start_timestamp
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Events, :events_list},
      url: "/v1/events/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceEvent, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Event Names

  List event names.

  **Scopes**: `events:read` `events:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `source`: Filter by event source.
    * `query`: Query to filter event names.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec events_list_names(keyword) ::
          {:ok, Polarex.Generated.ListResourceEventName.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def events_list_names(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :limit,
        :organization_id,
        :page,
        :query,
        :sorting,
        :source
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Events, :events_list_names},
      url: "/v1/events/names",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceEventName, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

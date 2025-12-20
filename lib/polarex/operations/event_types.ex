defmodule Polarex.EventTypes do
  @moduledoc """
  Provides API endpoints related to event types
  """

  @default_client Polarex.Support.Client

  @doc """
  List Event Types

  List event types with aggregated statistics.

  **Scopes**: `events:read` `events:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by external customer ID.
    * `query`: Query to filter event types by name or label.
    * `root_events`: When true, only return event types with root events (parent_id IS NULL).
    * `parent_id`: Filter by specific parent event ID.
    * `source`: Filter by event source (system or user).
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec event_types_list(keyword) ::
          {:ok, Polarex.ListResourceEventTypeWithStats.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def event_types_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :limit,
        :organization_id,
        :page,
        :parent_id,
        :query,
        :root_events,
        :sorting,
        :source
      ])

    client.request(%{
      args: [],
      call: {Polarex.EventTypes, :event_types_list},
      url: "/v1/event-types/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceEventTypeWithStats, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Event Type

  Update an event type's label.
  """
  @spec event_types_update(String.t(), Polarex.EventTypeUpdate.t(), keyword) ::
          {:ok, Polarex.EventType.t()} | {:error, Polarex.HTTPValidationError.t()}
  def event_types_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.EventTypes, :event_types_update},
      url: "/v1/event-types/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.EventTypeUpdate, :t}}],
      response: [
        {200, {Polarex.EventType, :t}},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

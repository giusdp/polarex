defmodule Polarex.Generated.Discounts do
  @moduledoc """
  Provides API endpoints related to discounts
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Discount

  Create a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_create(
          Polarex.Generated.DiscountFixedOnceForeverDurationCreate.t()
          | Polarex.Generated.DiscountFixedRepeatDurationCreate.t()
          | Polarex.Generated.DiscountPercentageOnceForeverDurationCreate.t()
          | Polarex.Generated.DiscountPercentageRepeatDurationCreate.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.DiscountFixedOnceForeverDuration.t()
           | Polarex.Generated.DiscountFixedRepeatDuration.t()
           | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
           | Polarex.Generated.DiscountPercentageRepeatDuration.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def discounts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Discounts, :discounts_create},
      url: "/v1/discounts/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDurationCreate, :t},
            {Polarex.Generated.DiscountFixedRepeatDurationCreate, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDurationCreate, :t},
            {Polarex.Generated.DiscountPercentageRepeatDurationCreate, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
            {Polarex.Generated.DiscountFixedRepeatDuration, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
          ]}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Discount

  Delete a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def discounts_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Discounts, :discounts_delete},
      url: "/v1/discounts/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Discount

  Get a discount by ID.

  **Scopes**: `discounts:read` `discounts:write`
  """
  @spec discounts_get(String.t(), keyword) ::
          {:ok,
           Polarex.Generated.DiscountFixedOnceForeverDuration.t()
           | Polarex.Generated.DiscountFixedRepeatDuration.t()
           | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
           | Polarex.Generated.DiscountPercentageRepeatDuration.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def discounts_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Discounts, :discounts_get},
      url: "/v1/discounts/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
            {Polarex.Generated.DiscountFixedRepeatDuration, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Discounts

  List discounts.

  **Scopes**: `discounts:read` `discounts:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `query`: Filter by name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec discounts_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceDiscount.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def discounts_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Discounts, :discounts_list},
      url: "/v1/discounts/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceDiscount, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Discount

  Update a discount.

  **Scopes**: `discounts:write`
  """
  @spec discounts_update(String.t(), Polarex.Generated.DiscountUpdate.t(), keyword) ::
          {:ok,
           Polarex.Generated.DiscountFixedOnceForeverDuration.t()
           | Polarex.Generated.DiscountFixedRepeatDuration.t()
           | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
           | Polarex.Generated.DiscountPercentageRepeatDuration.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def discounts_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Discounts, :discounts_update},
      url: "/v1/discounts/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.DiscountUpdate, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
            {Polarex.Generated.DiscountFixedRepeatDuration, :t},
            {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
            {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

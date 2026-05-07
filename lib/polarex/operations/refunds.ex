defmodule Polarex.Refunds do
  @moduledoc """
  Provides API endpoints related to refunds
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Refund

  Create a refund.

  **Scopes**: `refunds:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec refunds_create(body :: Polarex.RefundCreate.t(), opts :: keyword) ::
          {:ok, Polarex.Refund.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.RefundedAlready.t()}
  def refunds_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Refunds, :refunds_create},
      url: "/v1/refunds/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.RefundCreate, :t}}],
      response: [
        {201, {Polarex.Refund, :t}},
        {403, {Polarex.RefundedAlready, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Refunds

  List refunds.

  **Scopes**: `refunds:read` `refunds:write`

  ## Options

    * `id`: Filter by refund ID.
    * `organization_id`: Filter by organization ID.
    * `order_id`: Filter by order ID.
    * `subscription_id`: Filter by subscription ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `succeeded`: Filter by `succeeded`.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec refunds_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceRefund.t()} | {:error, Polarex.HTTPValidationError.t()}
  def refunds_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :external_customer_id,
        :id,
        :limit,
        :order_id,
        :organization_id,
        :page,
        :sorting,
        :subscription_id,
        :succeeded
      ])

    client.request(%{
      args: [],
      call: {Polarex.Refunds, :refunds_list},
      url: "/v1/refunds/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceRefund, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

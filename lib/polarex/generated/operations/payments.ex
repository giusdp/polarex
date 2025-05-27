defmodule Polarex.Generated.Payments do
  @moduledoc """
  Provides API endpoints related to payments
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Payment

  Get a payment by ID.

  **Scopes**: `payments:read`
  """
  @spec payments_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CardPayment.t() | Polarex.Generated.GenericPayment.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def payments_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Payments, :payments_get},
      url: "/v1/payments/#{id}",
      method: :get,
      response: [
        {200,
         {:union, [{Polarex.Generated.CardPayment, :t}, {Polarex.Generated.GenericPayment, :t}]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Payments

  List payments.

  **Scopes**: `payments:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `checkout_id`: Filter by checkout ID.
    * `order_id`: Filter by order ID.
    * `status`: Filter by payment status.
    * `method`: Filter by payment method.
    * `customer_email`: Filter by customer email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec payments_list(keyword) ::
          {:ok, Polarex.Generated.ListResource.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def payments_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :checkout_id,
        :customer_email,
        :limit,
        :method,
        :order_id,
        :organization_id,
        :page,
        :sorting,
        :status
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Payments, :payments_list},
      url: "/v1/payments/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResource, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

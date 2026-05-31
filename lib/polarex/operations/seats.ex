defmodule Polarex.Seats do
  @moduledoc """
  Provides API endpoints related to seats
  """

  @default_client Polarex.Support.Client

  @doc """
  Assign Seat

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_seats_assign_seat(body :: Polarex.CustomerSeatAssign.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_assign_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Seats, :customer_portal_seats_assign_seat},
      url: "/v1/customer-portal/seats",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.CustomerSeatAssign, :t}}],
      response: [
        {200, {Polarex.CustomerSeat, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Claimed Subscriptions

  List all subscriptions where the authenticated customer has claimed a seat.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_seats_list_claimed_subscriptions(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_list_claimed_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {Polarex.Seats, :customer_portal_seats_list_claimed_subscriptions},
      url: "/v1/customer-portal/seats/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerSubscription, :t}},
        {401, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Seats

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `subscription_id`: Subscription ID
    * `order_id`: Order ID

  """
  @spec customer_portal_seats_list_seats(opts :: keyword) ::
          {:ok, Polarex.SeatsList.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_list_seats(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order_id, :subscription_id])

    client.request(%{
      args: [],
      call: {Polarex.Seats, :customer_portal_seats_list_seats},
      url: "/v1/customer-portal/seats",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.SeatsList, :t}},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Resend Invitation
  """
  @spec customer_portal_seats_resend_invitation(seat_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_resend_invitation(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.Seats, :customer_portal_seats_resend_invitation},
      url: "/v1/customer-portal/seats/#{seat_id}/resend",
      method: :post,
      response: [
        {200, {Polarex.CustomerSeat, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Revoke Seat
  """
  @spec customer_portal_seats_revoke_seat(seat_id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_seats_revoke_seat(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.Seats, :customer_portal_seats_revoke_seat},
      url: "/v1/customer-portal/seats/#{seat_id}",
      method: :delete,
      response: [
        {200, {Polarex.CustomerSeat, :t}},
        {401, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

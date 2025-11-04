defmodule Polarex.CustomerSeats do
  @moduledoc """
  Provides API endpoints related to customer seats
  """

  @default_client Polarex.Support.Client

  @doc """
  Assign Seat

  **Scopes**: `customer_seats:write`
  """
  @spec customer_seats_assign_seat(Polarex.SeatAssign.t(), keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_assign_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerSeats, :customer_seats_assign_seat},
      url: "/v1/customer-seats",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.SeatAssign, :t}}],
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
  Claim Seat
  """
  @spec customer_seats_claim_seat(Polarex.SeatClaim.t(), keyword) ::
          {:ok, Polarex.CustomerSeatClaimResponse.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_claim_seat(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerSeats, :customer_seats_claim_seat},
      url: "/v1/customer-seats/claim",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.SeatClaim, :t}}],
      response: [
        {200, {Polarex.CustomerSeatClaimResponse, :t}},
        {400, :null},
        {403, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Claim Info
  """
  @spec customer_seats_get_claim_info(String.t(), keyword) ::
          {:ok, Polarex.SeatClaimInfo.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_get_claim_info(invitation_token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [invitation_token: invitation_token],
      call: {Polarex.CustomerSeats, :customer_seats_get_claim_info},
      url: "/v1/customer-seats/claim/#{invitation_token}",
      method: :get,
      response: [
        {200, {Polarex.SeatClaimInfo, :t}},
        {400, :null},
        {403, :null},
        {404, :null},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Seats

  **Scopes**: `customer_seats:write`

  ## Options

    * `subscription_id`
    * `order_id`

  """
  @spec customer_seats_list_seats(keyword) ::
          {:ok, Polarex.SeatsList.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_list_seats(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order_id, :subscription_id])

    client.request(%{
      args: [],
      call: {Polarex.CustomerSeats, :customer_seats_list_seats},
      url: "/v1/customer-seats",
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

  **Scopes**: `customer_seats:write`
  """
  @spec customer_seats_resend_invitation(String.t(), keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_resend_invitation(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.CustomerSeats, :customer_seats_resend_invitation},
      url: "/v1/customer-seats/#{seat_id}/resend",
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

  **Scopes**: `customer_seats:write`
  """
  @spec customer_seats_revoke_seat(String.t(), keyword) ::
          {:ok, Polarex.CustomerSeat.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_seats_revoke_seat(seat_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [seat_id: seat_id],
      call: {Polarex.CustomerSeats, :customer_seats_revoke_seat},
      url: "/v1/customer-seats/#{seat_id}",
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

defmodule Polarex.Generated.Checkouts do
  @moduledoc """
  Provides API endpoints related to checkouts
  """

  @default_client Polarex.Support.Client

  @doc """
  Confirm Checkout Session from Client

  Confirm a checkout session by client secret.

  Orders and subscriptions will be processed.
  """
  @spec checkouts_client_confirm(String.t(), Polarex.Generated.CheckoutConfirmStripe.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutPublicConfirmed.t()}
          | {:error,
             Polarex.Generated.AlreadyActiveSubscriptionError.t()
             | Polarex.Generated.ExpiredCheckoutError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotOpenCheckout.t()
             | Polarex.Generated.PaymentError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_client_confirm(client_secret, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret, body: body],
      call: {Polarex.Generated.Checkouts, :checkouts_client_confirm},
      url: "/v1/checkouts/client/#{client_secret}/confirm",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.CheckoutConfirmStripe, :t}}],
      response: [
        {200, {Polarex.Generated.CheckoutPublicConfirmed, :t}},
        {400, {Polarex.Generated.PaymentError, :t}},
        {403,
         {:union,
          [
            {Polarex.Generated.AlreadyActiveSubscriptionError, :t},
            {Polarex.Generated.NotOpenCheckout, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {410, {Polarex.Generated.ExpiredCheckoutError, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Checkout Session from Client

  Get a checkout session by client secret.
  """
  @spec checkouts_client_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutPublic.t()}
          | {:error,
             Polarex.Generated.ExpiredCheckoutError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_client_get(client_secret, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret],
      call: {Polarex.Generated.Checkouts, :checkouts_client_get},
      url: "/v1/checkouts/client/#{client_secret}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CheckoutPublic, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {410, {Polarex.Generated.ExpiredCheckoutError, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Session from Client

  Update a checkout session by client secret.
  """
  @spec checkouts_client_update(String.t(), Polarex.Generated.CheckoutUpdatePublic.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutPublic.t()}
          | {:error,
             Polarex.Generated.AlreadyActiveSubscriptionError.t()
             | Polarex.Generated.ExpiredCheckoutError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotOpenCheckout.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_client_update(client_secret, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_secret: client_secret, body: body],
      call: {Polarex.Generated.Checkouts, :checkouts_client_update},
      url: "/v1/checkouts/client/#{client_secret}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CheckoutUpdatePublic, :t}}],
      response: [
        {200, {Polarex.Generated.CheckoutPublic, :t}},
        {403,
         {:union,
          [
            {Polarex.Generated.AlreadyActiveSubscriptionError, :t},
            {Polarex.Generated.NotOpenCheckout, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {410, {Polarex.Generated.ExpiredCheckoutError, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Checkout Session

  Create a checkout session.

  **Scopes**: `checkouts:write`
  """
  @spec checkouts_create(Polarex.Generated.CheckoutProductsCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Checkout.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkouts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Checkouts, :checkouts_create},
      url: "/v1/checkouts/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.CheckoutProductsCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Checkout, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Checkout Session

  Get a checkout session by ID.

  **Scopes**: `checkouts:read` `checkouts:write`
  """
  @spec checkouts_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Checkout.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Checkouts, :checkouts_get},
      url: "/v1/checkouts/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Checkout, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Checkout Sessions

  List checkout sessions.

  **Scopes**: `checkouts:read` `checkouts:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `customer_id`: Filter by customer ID.
    * `status`: Filter by checkout session status.
    * `query`: Filter by customer email.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec checkouts_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCheckout.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkouts_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :customer_id,
        :limit,
        :organization_id,
        :page,
        :product_id,
        :query,
        :sorting,
        :status
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Checkouts, :checkouts_list},
      url: "/v1/checkouts/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCheckout, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Session

  Update a checkout session.

  **Scopes**: `checkouts:write`
  """
  @spec checkouts_update(String.t(), Polarex.Generated.CheckoutUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Checkout.t()}
          | {:error,
             Polarex.Generated.AlreadyActiveSubscriptionError.t()
             | Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotOpenCheckout.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def checkouts_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Checkouts, :checkouts_update},
      url: "/v1/checkouts/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CheckoutUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Checkout, :t}},
        {403,
         {:union,
          [
            {Polarex.Generated.AlreadyActiveSubscriptionError, :t},
            {Polarex.Generated.NotOpenCheckout, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

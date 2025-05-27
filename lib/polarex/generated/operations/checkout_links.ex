defmodule Polarex.Generated.CheckoutLinks do
  @moduledoc """
  Provides API endpoints related to checkout links
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Checkout Link

  Create a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_create(
          Polarex.Generated.CheckoutLinkCreateProduct.t()
          | Polarex.Generated.CheckoutLinkCreateProductPrice.t()
          | Polarex.Generated.CheckoutLinkCreateProducts.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.CheckoutLink.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkout_links_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.CheckoutLinks, :checkout_links_create},
      url: "/v1/checkout-links/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CheckoutLinkCreateProduct, :t},
            {Polarex.Generated.CheckoutLinkCreateProductPrice, :t},
            {Polarex.Generated.CheckoutLinkCreateProducts, :t}
          ]}}
      ],
      response: [
        {201, {Polarex.Generated.CheckoutLink, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Checkout Link

  Delete a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkout_links_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CheckoutLinks, :checkout_links_delete},
      url: "/v1/checkout-links/#{id}",
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
  Get Checkout Link

  Get a checkout link by ID.

  **Scopes**: `checkout_links:read` `checkout_links:write`
  """
  @spec checkout_links_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutLink.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkout_links_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CheckoutLinks, :checkout_links_get},
      url: "/v1/checkout-links/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.CheckoutLink, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Checkout Links

  List checkout links.

  **Scopes**: `checkout_links:read` `checkout_links:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec checkout_links_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceCheckoutLink.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def checkout_links_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :product_id, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Generated.CheckoutLinks, :checkout_links_list},
      url: "/v1/checkout-links/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCheckoutLink, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Checkout Link

  Update a checkout link.

  **Scopes**: `checkout_links:write`
  """
  @spec checkout_links_update(String.t(), Polarex.Generated.CheckoutLinkUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.CheckoutLink.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def checkout_links_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.CheckoutLinks, :checkout_links_update},
      url: "/v1/checkout-links/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.CheckoutLinkUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.CheckoutLink, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

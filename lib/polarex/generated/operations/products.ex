defmodule Polarex.Generated.Products do
  @moduledoc """
  Provides API endpoints related to products
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Product

  Create a product.

  **Scopes**: `products:write`
  """
  @spec products_create(Polarex.Generated.ProductCreate.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def products_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Products, :products_create},
      url: "/v1/products/",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.ProductCreate, :t}}],
      response: [
        {201, {Polarex.Generated.Product, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Product

  Get a product by ID.

  **Scopes**: `products:read` `products:write`
  """
  @spec products_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def products_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Products, :products_get},
      url: "/v1/products/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.Product, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Products

  List products.

  **Scopes**: `products:read` `products:write`

  ## Options

    * `id`: Filter by product ID.
    * `organization_id`: Filter by organization ID.
    * `query`: Filter by product name.
    * `is_archived`: Filter on archived products.
    * `is_recurring`: Filter on recurring products. If `true`, only subscriptions tiers are returned. If `false`, only one-time purchase products are returned. 
    * `benefit_id`: Filter products granting specific benefit.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec products_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceProduct.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def products_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :benefit_id,
        :id,
        :is_archived,
        :is_recurring,
        :limit,
        :organization_id,
        :page,
        :query,
        :sorting
      ])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Products, :products_list},
      url: "/v1/products/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceProduct, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product

  Update a product.

  **Scopes**: `products:write`
  """
  @spec products_update(String.t(), Polarex.Generated.ProductUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def products_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Products, :products_update},
      url: "/v1/products/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.ProductUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Product, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Product Benefits

  Update benefits granted by a product.

  **Scopes**: `products:write`
  """
  @spec products_update_benefits(String.t(), Polarex.Generated.ProductBenefitsUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.Product.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def products_update_benefits(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Products, :products_update_benefits},
      url: "/v1/products/#{id}/benefits",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.ProductBenefitsUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.Product, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

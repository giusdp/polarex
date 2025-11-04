defmodule Polarex.Wallets do
  @moduledoc """
  Provides API endpoints related to wallets
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Wallet

  Get a wallet by ID for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_wallets_get(String.t(), keyword) ::
          {:ok, Polarex.CustomerWallet.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_wallets_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Wallets, :customer_portal_wallets_get},
      url: "/v1/customer-portal/wallets/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerWallet, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Wallets

  List wallets of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_wallets_list(keyword) ::
          {:ok, Polarex.ListResourceCustomerWallet.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_wallets_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Wallets, :customer_portal_wallets_list},
      url: "/v1/customer-portal/wallets/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerWallet, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Wallet

  Get a wallet by ID.

  **Scopes**: `wallets:read`
  """
  @spec wallets_get(String.t(), keyword) ::
          {:ok, Polarex.Wallet.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def wallets_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Wallets, :wallets_get},
      url: "/v1/wallets/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Wallet, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Wallets

  List wallets.

  **Scopes**: `wallets:read`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `customer_id`: Filter by customer ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec wallets_list(keyword) ::
          {:ok, Polarex.ListResourceWallet.t()} | {:error, Polarex.HTTPValidationError.t()}
  def wallets_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:customer_id, :limit, :organization_id, :page, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Wallets, :wallets_list},
      url: "/v1/wallets/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceWallet, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Top-Up Wallet

  Top-up a wallet by adding funds to its balance.

  The customer should have a valid payment method on file.

  **Scopes**: `wallets:write`
  """
  @spec wallets_top_up(String.t(), Polarex.WalletTopUpCreate.t(), keyword) ::
          {:ok, Polarex.Wallet.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.MissingPaymentMethodError.t()
             | Polarex.PaymentIntentFailedError.t()
             | Polarex.ResourceNotFound.t()}
  def wallets_top_up(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Wallets, :wallets_top_up},
      url: "/v1/wallets/#{id}/top-up",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.WalletTopUpCreate, :t}}],
      response: [
        {200, {Polarex.Wallet, :t}},
        {201, :null},
        {400, {Polarex.PaymentIntentFailedError, :t}},
        {402, {Polarex.MissingPaymentMethodError, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

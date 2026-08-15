defmodule Polarex.Subscriptions do
  @moduledoc """
  Provides API endpoints related to subscriptions
  """

  @default_client Polarex.Support.Client

  @doc """
  Cancel Subscription

  Cancel a subscription of the authenticated customer.
  """
  @spec customer_portal_subscriptions_cancel(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_cancel(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Subscriptions, :customer_portal_subscriptions_cancel},
      url: "/v1/customer-portal/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription for the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_subscriptions_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Subscriptions, :customer_portal_subscriptions_get},
      url: "/v1/customer-portal/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Subscriptions

  List subscriptions of the authenticated customer.

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `product_id`: Filter by product ID.
    * `active`: Filter by active or cancelled subscription.
    * `query`: Search by product or organization name.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec customer_portal_subscriptions_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceCustomerSubscription.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def customer_portal_subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:active, :limit, :page, :product_id, :query, :sorting])

    client.request(%{
      args: [],
      call: {Polarex.Subscriptions, :customer_portal_subscriptions_list},
      url: "/v1/customer-portal/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomerSubscription, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Subscription

  Update a subscription of the authenticated customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec customer_portal_subscriptions_update(
          id :: String.t(),
          body ::
            Polarex.CustomerSubscriptionCancel.t()
            | Polarex.CustomerSubscriptionPause.t()
            | Polarex.CustomerSubscriptionResume.t()
            | Polarex.CustomerSubscriptionUpdateClear.t()
            | Polarex.CustomerSubscriptionUpdateProduct.t()
            | Polarex.CustomerSubscriptionUpdateSeats.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.CustomerSubscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.PauseResumeNotAllowed.t()
             | Polarex.PaymentFailed.t()
             | Polarex.PaymentMethodRequired.t()
             | Polarex.ResourceNotFound.t()}
  def customer_portal_subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Subscriptions, :customer_portal_subscriptions_update},
      url: "/v1/customer-portal/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomerSubscriptionCancel, :t},
            {Polarex.CustomerSubscriptionPause, :t},
            {Polarex.CustomerSubscriptionResume, :t},
            {Polarex.CustomerSubscriptionUpdateClear, :t},
            {Polarex.CustomerSubscriptionUpdateProduct, :t},
            {Polarex.CustomerSubscriptionUpdateSeats, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.CustomerSubscription, :t}},
        {402, {Polarex.PaymentFailed, :t}},
        {403,
         {:union,
          [{Polarex.AlreadyCanceledSubscription, :t}, {Polarex.PauseResumeNotAllowed, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.PaymentMethodRequired, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Subscription

  Create a subscription programmatically.

  This endpoint only allows to create subscription on free products.
  For paid products, use the checkout flow.

  No initial order will be created and no confirmation email will be sent.

  **Scopes**: `subscriptions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec subscriptions_create(
          body ::
            Polarex.SubscriptionCreateCustomer.t()
            | Polarex.SubscriptionCreateExternalCustomer.t(),
          opts :: keyword
        ) :: {:ok, Polarex.Subscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Subscriptions, :subscriptions_create},
      url: "/v1/subscriptions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCreateCustomer, :t},
            {Polarex.SubscriptionCreateExternalCustomer, :t}
          ]}}
      ],
      response: [{201, {Polarex.Subscription, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Export Subscriptions

  Export subscriptions as a CSV file.

  **Scopes**: `subscriptions:read` `subscriptions:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `status`: Filter by subscription status.
    * `cancel_at_period_end`: Filter by subscriptions that are set to cancel at period end.
    * `started_after`: Only include subscriptions started after this date. Must include a UTC offset.
    * `started_before`: Only include subscriptions started before this date. Must include a UTC offset.
    * `timezone`: Time zone used to render dates in the CSV.
    * `columns`: Columns to include in the CSV, in order. Defaults to email, started_at, product, amount, currency, status and recurring_interval.

  """
  @spec subscriptions_export(opts :: keyword) ::
          {:ok, String.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_export(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :cancel_at_period_end,
        :columns,
        :organization_id,
        :product_id,
        :started_after,
        :started_before,
        :status,
        :timezone
      ])

    client.request(%{
      args: [],
      call: {Polarex.Subscriptions, :subscriptions_export},
      url: "/v1/subscriptions/export",
      method: :get,
      query: query,
      response: [{200, :string}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Subscription

  Get a subscription by ID.

  **Scopes**: `subscriptions:read` `subscriptions:write`
  """
  @spec subscriptions_get(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def subscriptions_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Subscriptions, :subscriptions_get},
      url: "/v1/subscriptions/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Subscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Subscriptions

  List subscriptions.

  **Scopes**: `subscriptions:read` `subscriptions:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `product_id`: Filter by product ID.
    * `customer_id`: Filter by customer ID.
    * `external_customer_id`: Filter by customer external ID.
    * `discount_id`: Filter by discount ID.
    * `active`: Filter by active or inactive subscription.
    * `status`: Filter by subscription status.
    * `cancel_at_period_end`: Filter by subscriptions that are set to cancel at period end.
    * `customer_cancellation_reason`: Filter by customer cancellation reason.
    * `canceled_at_after`: Filter by cancellation date (after or equal to).
    * `canceled_at_before`: Filter by cancellation date (before or equal to).
    * `started_after`: Only include subscriptions started after this date.
    * `started_before`: Only include subscriptions started before this date.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.
    * `metadata`: Filter by metadata key-value pairs. It uses the `deepObject` style, e.g. `?metadata[key]=value`.

  """
  @spec subscriptions_list(opts :: keyword) ::
          {:ok, Polarex.ListResourceSubscription.t()} | {:error, Polarex.HTTPValidationError.t()}
  def subscriptions_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :active,
        :cancel_at_period_end,
        :canceled_at_after,
        :canceled_at_before,
        :customer_cancellation_reason,
        :customer_id,
        :discount_id,
        :external_customer_id,
        :limit,
        :metadata,
        :organization_id,
        :page,
        :product_id,
        :sorting,
        :started_after,
        :started_before,
        :status
      ])

    client.request(%{
      args: [],
      call: {Polarex.Subscriptions, :subscriptions_list},
      url: "/v1/subscriptions/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceSubscription, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Revoke Subscription

  Revoke a subscription, i.e cancel immediately.

  **Scopes**: `subscriptions:write`
  """
  @spec subscriptions_revoke(id :: String.t(), opts :: keyword) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.SubscriptionLocked.t()}
  def subscriptions_revoke(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Subscriptions, :subscriptions_revoke},
      url: "/v1/subscriptions/#{id}",
      method: :delete,
      response: [
        {200, {Polarex.Subscription, :t}},
        {403, {Polarex.AlreadyCanceledSubscription, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.SubscriptionLocked, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Subscription

  Update a subscription.

  **Scopes**: `subscriptions:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec subscriptions_update(
          id :: String.t(),
          body ::
            Polarex.SubscriptionCancel.t()
            | Polarex.SubscriptionPause.t()
            | Polarex.SubscriptionResume.t()
            | Polarex.SubscriptionRevoke.t()
            | Polarex.SubscriptionUpdateBase.t()
            | Polarex.SubscriptionUpdateBillingPeriod.t()
            | Polarex.SubscriptionUpdateClear.t()
            | Polarex.SubscriptionUpdateSeats.t(),
          opts :: keyword
        ) ::
          {:ok, Polarex.Subscription.t()}
          | {:error,
             Polarex.AlreadyCanceledSubscription.t()
             | Polarex.HTTPValidationError.t()
             | Polarex.InactiveSubscription.t()
             | Polarex.PaymentFailed.t()
             | Polarex.ResourceNotFound.t()
             | Polarex.SubscriptionLocked.t()}
  def subscriptions_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Subscriptions, :subscriptions_update},
      url: "/v1/subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.SubscriptionCancel, :t},
            {Polarex.SubscriptionPause, :t},
            {Polarex.SubscriptionResume, :t},
            {Polarex.SubscriptionRevoke, :t},
            {Polarex.SubscriptionUpdateBase, :t},
            {Polarex.SubscriptionUpdateBillingPeriod, :t},
            {Polarex.SubscriptionUpdateClear, :t},
            {Polarex.SubscriptionUpdateSeats, :t}
          ]}}
      ],
      response: [
        {200, {Polarex.Subscription, :t}},
        {402, {Polarex.PaymentFailed, :t}},
        {403,
         {:union, [{Polarex.AlreadyCanceledSubscription, :t}, {Polarex.InactiveSubscription, :t}]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {409, {Polarex.SubscriptionLocked, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

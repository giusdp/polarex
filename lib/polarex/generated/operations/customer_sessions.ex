defmodule Polarex.Generated.CustomerSessions do
  @moduledoc """
  Provides API endpoint related to customer sessions
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Customer Session

  Create a customer session.

  **Scopes**: `customer_sessions:write`
  """
  @spec customer_sessions_create(
          Polarex.Generated.CustomerSessionCustomerExternalIDCreate.t()
          | Polarex.Generated.CustomerSessionCustomerIDCreate.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.CustomerSession.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def customer_sessions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.CustomerSessions, :customer_sessions_create},
      url: "/v1/customer-sessions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomerSessionCustomerExternalIDCreate, :t},
            {Polarex.Generated.CustomerSessionCustomerIDCreate, :t}
          ]}}
      ],
      response: [
        {201, {Polarex.Generated.CustomerSession, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end

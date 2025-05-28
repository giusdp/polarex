defmodule Polarex.CustomerSessions do
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
          Polarex.CustomerSessionCustomerExternalIDCreate.t()
          | Polarex.CustomerSessionCustomerIDCreate.t(),
          keyword
        ) :: {:ok, Polarex.CustomerSession.t()} | {:error, Polarex.HTTPValidationError.t()}
  def customer_sessions_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomerSessions, :customer_sessions_create},
      url: "/v1/customer-sessions/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomerSessionCustomerExternalIDCreate, :t},
            {Polarex.CustomerSessionCustomerIDCreate, :t}
          ]}}
      ],
      response: [{201, {Polarex.CustomerSession, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end
end

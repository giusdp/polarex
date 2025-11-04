defmodule Polarex.CustomerSession do
  @moduledoc """
  Provides API endpoint related to customer session
  """

  @default_client Polarex.Support.Client

  @doc """
  Introspect Customer Session

  Introspect the current session and return its information.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_session_introspect(keyword) ::
          {:ok, Polarex.CustomerCustomerSession.t()} | :error
  def customer_portal_customer_session_introspect(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.CustomerSession, :customer_portal_customer_session_introspect},
      url: "/v1/customer-portal/customer-session/introspect",
      method: :get,
      response: [{200, {Polarex.CustomerCustomerSession, :t}}],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          customer: Polarex.Customer.t(),
          customer_id: String.t(),
          customer_portal_url: String.t(),
          expires_at: DateTime.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          return_url: String.t() | nil,
          token: String.t()
        }

  defstruct [
    :created_at,
    :customer,
    :customer_id,
    :customer_portal_url,
    :expires_at,
    :id,
    :modified_at,
    :return_url,
    :token
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      customer: {Polarex.Customer, :t},
      customer_id: {:string, :generic},
      customer_portal_url: {:string, :generic},
      expires_at: {:string, :date_time},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      return_url: {:union, [{:string, :generic}, :null]},
      token: {:string, :generic}
    ]
  end
end

defmodule Polarex.CustomerSession do
  @moduledoc """
  Provides API endpoints related to customer session
  """

  @default_client Polarex.Support.Client

  @doc """
  Get Authenticated Portal User

  Get information about the currently authenticated portal user.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_session_get_authenticated_user(opts :: keyword) ::
          {:ok, Polarex.PortalAuthenticatedUser.t()} | :error
  def customer_portal_customer_session_get_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Polarex.CustomerSession, :customer_portal_customer_session_get_authenticated_user},
      url: "/v1/customer-portal/customer-session/user",
      method: :get,
      response: [{200, {Polarex.PortalAuthenticatedUser, :t}}],
      opts: opts
    })
  end

  @doc """
  Introspect Customer Session

  Introspect the current session and return its information.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_customer_session_introspect(opts :: keyword) ::
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
          customer: Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t(),
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
      created_at: {:string, "date-time"},
      customer: {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]},
      customer_id: {:string, "uuid4"},
      customer_portal_url: :string,
      expires_at: {:string, "date-time"},
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      return_url: {:union, [:string, :null]},
      token: :string
    ]
  end
end

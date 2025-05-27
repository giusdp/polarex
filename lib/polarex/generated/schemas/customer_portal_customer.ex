defmodule Polarex.Generated.CustomerPortalCustomer do
  @moduledoc """
  Provides struct and type for a CustomerPortalCustomer
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Generated.Address.t() | nil,
          created_at: DateTime.t(),
          email: String.t(),
          email_verified: boolean,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          oauth_accounts: Polarex.Generated.OauthAccounts.t(),
          tax_id: [any] | nil
        }

  defstruct [
    :billing_address,
    :created_at,
    :email,
    :email_verified,
    :id,
    :modified_at,
    :name,
    :oauth_accounts,
    :tax_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.Generated.Address, :t}, :null]},
      created_at: {:string, :date_time},
      email: {:string, :generic},
      email_verified: :boolean,
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      oauth_accounts: {Polarex.Generated.OauthAccounts, :t},
      tax_id: {:union, [[:unknown], :null]}
    ]
  end
end

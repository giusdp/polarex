defmodule Polarex.CustomerPortalCustomer do
  @moduledoc """
  Provides struct and type for a CustomerPortalCustomer
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Address.t() | nil,
          billing_name: String.t() | nil,
          created_at: DateTime.t(),
          default_payment_method_id: String.t() | nil,
          email: String.t(),
          email_verified: boolean,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          oauth_accounts: Polarex.OauthAccounts.t(),
          tax_id: [any] | nil
        }

  defstruct [
    :billing_address,
    :billing_name,
    :created_at,
    :default_payment_method_id,
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
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      billing_name: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      default_payment_method_id: {:union, [{:string, :generic}, :null]},
      email: {:string, :generic},
      email_verified: :boolean,
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      oauth_accounts: {Polarex.OauthAccounts, :t},
      tax_id: {:union, [[:unknown], :null]}
    ]
  end
end

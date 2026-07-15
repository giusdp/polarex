defmodule Polarex.CustomerPortalCustomer do
  @moduledoc """
  Provides struct and type for a CustomerPortalCustomer
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Address.t() | nil,
          billing_name: String.t() | nil,
          created_at: DateTime.t(),
          default_payment_method_id: String.t() | nil,
          email: String.t() | nil,
          email_verified: boolean,
          id: String.t(),
          locale: String.t() | nil,
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          oauth_accounts: map,
          tax_id: [any] | nil,
          type: String.t() | nil
        }

  defstruct [
    :billing_address,
    :billing_name,
    :created_at,
    :default_payment_method_id,
    :email,
    :email_verified,
    :id,
    :locale,
    :modified_at,
    :name,
    :oauth_accounts,
    :tax_id,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      billing_name: {:union, [:string, :null]},
      created_at: {:string, "date-time"},
      default_payment_method_id: {:union, [{:string, "uuid4"}, :null]},
      email: {:union, [:string, :null]},
      email_verified: :boolean,
      id: {:string, "uuid4"},
      locale: {:union, [:string, :null]},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: {:union, [:string, :null]},
      oauth_accounts: :map,
      tax_id: {:union, [[:unknown], :null]},
      type: {:union, [{:enum, ["individual", "team"]}, :null]}
    ]
  end
end

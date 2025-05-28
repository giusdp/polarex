defmodule Polarex.SubscriptionCustomer do
  @moduledoc """
  Provides struct and type for a SubscriptionCustomer
  """

  @type t :: %__MODULE__{
          avatar_url: String.t(),
          billing_address: Polarex.Address.t() | nil,
          created_at: DateTime.t(),
          deleted_at: DateTime.t() | nil,
          email: String.t(),
          email_verified: boolean,
          external_id: String.t() | nil,
          id: String.t(),
          metadata: Polarex.Metadata.t(),
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          organization_id: String.t(),
          tax_id: [any] | nil
        }

  defstruct [
    :avatar_url,
    :billing_address,
    :created_at,
    :deleted_at,
    :email,
    :email_verified,
    :external_id,
    :id,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :tax_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:string, :generic},
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      created_at: {:string, :date_time},
      deleted_at: {:union, [{:string, :date_time}, :null]},
      email: {:string, :generic},
      email_verified: :boolean,
      external_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      organization_id: {:string, :generic},
      tax_id: {:union, [[:unknown], :null]}
    ]
  end
end

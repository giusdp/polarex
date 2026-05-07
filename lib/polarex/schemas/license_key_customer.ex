defmodule Polarex.LicenseKeyCustomer do
  @moduledoc """
  Provides struct and type for a LicenseKeyCustomer
  """

  @type t :: %__MODULE__{
          avatar_url: String.t(),
          billing_address: Polarex.Address.t() | nil,
          created_at: DateTime.t(),
          deleted_at: DateTime.t() | nil,
          email: String.t() | nil,
          email_verified: boolean,
          external_id: String.t() | nil,
          id: String.t(),
          locale: String.t() | nil,
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          organization_id: String.t(),
          tax_id: [any] | nil,
          type: String.t()
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
    :locale,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :tax_id,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: :string,
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      created_at: {:string, "date-time"},
      deleted_at: {:union, [{:string, "date-time"}, :null]},
      email: {:union, [:string, :null]},
      email_verified: :boolean,
      external_id: {:union, [:string, :null]},
      id: {:string, "uuid4"},
      locale: {:union, [:string, :null]},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: {:union, [:string, :null]},
      organization_id: {:string, "uuid4"},
      tax_id: {:union, [[:unknown], :null]},
      type: {:enum, ["individual", "team"]}
    ]
  end
end

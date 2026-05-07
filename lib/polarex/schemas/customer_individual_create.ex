defmodule Polarex.CustomerIndividualCreate do
  @moduledoc """
  Provides struct and type for a CustomerIndividualCreate
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.AddressInput.t() | nil,
          email: String.t(),
          external_id: String.t() | nil,
          locale: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          organization_id: String.t() | nil,
          owner: Polarex.MemberOwnerCreate.t() | nil,
          tax_id: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :billing_address,
    :email,
    :external_id,
    :locale,
    :metadata,
    :name,
    :organization_id,
    :owner,
    :tax_id,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      email: {:string, "email"},
      external_id: {:union, [:string, :null]},
      locale: {:union, [:string, :null]},
      metadata: :map,
      name: {:union, [:string, :null]},
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      owner: {:union, [{Polarex.MemberOwnerCreate, :t}, :null]},
      tax_id: {:union, [:string, :null]},
      type: {:const, "individual"}
    ]
  end
end

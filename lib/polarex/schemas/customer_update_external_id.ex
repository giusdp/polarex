defmodule Polarex.CustomerUpdateExternalID do
  @moduledoc """
  Provides struct and type for a CustomerUpdateExternalID
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.AddressInput.t() | nil,
          email: String.t() | nil,
          locale: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          tax_id: String.t() | nil
        }

  defstruct [:billing_address, :email, :locale, :metadata, :name, :tax_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      email: {:union, [{:string, "email"}, :null]},
      locale: {:union, [:string, :null]},
      metadata: :map,
      name: {:union, [:string, :null]},
      tax_id: {:union, [:string, :null]}
    ]
  end
end

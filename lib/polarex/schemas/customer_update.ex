defmodule Polarex.CustomerUpdate do
  @moduledoc """
  Provides struct and type for a CustomerUpdate
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.AddressInput.t() | nil,
          email: String.t() | nil,
          external_id: String.t() | nil,
          locale: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          tax_id: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:billing_address, :email, :external_id, :locale, :metadata, :name, :tax_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      email: {:union, [{:string, "email"}, :null]},
      external_id: {:union, [:string, :null]},
      locale: {:union, [:string, :null]},
      metadata: :map,
      name: {:union, [:string, :null]},
      tax_id: {:union, [:string, :null]},
      type: {:union, [{:enum, ["individual", "team"]}, :null]}
    ]
  end
end

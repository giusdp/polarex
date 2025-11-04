defmodule Polarex.CustomerPortalCustomerUpdate do
  @moduledoc """
  Provides struct and type for a CustomerPortalCustomerUpdate
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.AddressInput.t() | nil,
          billing_name: String.t() | nil,
          tax_id: String.t() | nil
        }

  defstruct [:billing_address, :billing_name, :tax_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.AddressInput, :t}, :null]},
      billing_name: {:union, [{:string, :generic}, :null]},
      tax_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

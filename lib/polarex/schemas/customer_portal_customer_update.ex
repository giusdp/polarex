defmodule Polarex.CustomerPortalCustomerUpdate do
  @moduledoc """
  Provides struct and type for a CustomerPortalCustomerUpdate
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Address.t() | nil,
          email: String.t() | nil,
          name: String.t() | nil,
          tax_id: String.t() | nil
        }

  defstruct [:billing_address, :email, :name, :tax_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      email: {:union, [{:string, :email}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      tax_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

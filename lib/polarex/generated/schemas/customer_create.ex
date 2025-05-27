defmodule Polarex.Generated.CustomerCreate do
  @moduledoc """
  Provides struct and type for a CustomerCreate
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Generated.Address.t() | nil,
          email: String.t(),
          external_id: String.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t() | nil,
          organization_id: String.t() | nil,
          tax_id: [any] | nil
        }

  defstruct [:billing_address, :email, :external_id, :metadata, :name, :organization_id, :tax_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.Generated.Address, :t}, :null]},
      email: {:string, :email},
      external_id: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]},
      organization_id: {:union, [{:string, :generic}, :null]},
      tax_id: {:union, [[:unknown], :null]}
    ]
  end
end

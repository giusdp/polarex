defmodule Polarex.CustomerUpdateExternalID do
  @moduledoc """
  Provides struct and type for a CustomerUpdateExternalID
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Address.t() | nil,
          email: String.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          name: String.t() | nil,
          tax_id: [any] | nil
        }

  defstruct [:billing_address, :email, :metadata, :name, :tax_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      email: {:union, [{:string, :email}, :null]},
      metadata: {Polarex.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]},
      tax_id: {:union, [[:unknown], :null]}
    ]
  end
end

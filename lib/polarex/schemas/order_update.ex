defmodule Polarex.OrderUpdate do
  @moduledoc """
  Provides struct and type for a OrderUpdate
  """

  @type t :: %__MODULE__{
          billing_address: Polarex.Address.t() | nil,
          billing_name: String.t() | nil
        }

  defstruct [:billing_address, :billing_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      billing_name: {:union, [{:string, :generic}, :null]}
    ]
  end
end

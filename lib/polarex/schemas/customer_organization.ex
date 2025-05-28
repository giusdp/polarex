defmodule Polarex.CustomerOrganization do
  @moduledoc """
  Provides struct and type for a CustomerOrganization
  """

  @type t :: %__MODULE__{
          organization: Polarex.Organization.t(),
          products: [Polarex.CustomerProduct.t()]
        }

  defstruct [:organization, :products]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: {Polarex.Organization, :t}, products: [{Polarex.CustomerProduct, :t}]]
  end
end

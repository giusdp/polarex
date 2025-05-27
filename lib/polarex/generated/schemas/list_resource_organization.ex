defmodule Polarex.Generated.ListResourceOrganization do
  @moduledoc """
  Provides struct and type for a ListResourceOrganization
  """

  @type t :: %__MODULE__{
          items: [Polarex.Generated.Organization.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [{Polarex.Generated.Organization, :t}],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

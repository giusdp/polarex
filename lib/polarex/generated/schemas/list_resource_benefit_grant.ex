defmodule Polarex.Generated.ListResourceBenefitGrant do
  @moduledoc """
  Provides struct and type for a ListResourceBenefitGrant
  """

  @type t :: %__MODULE__{
          items: [Polarex.Generated.BenefitGrant.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [{Polarex.Generated.BenefitGrant, :t}],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

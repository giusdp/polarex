defmodule Polarex.Generated.ListResourceCustomerOrder do
  @moduledoc """
  Provides struct and type for a ListResourceCustomerOrder
  """

  @type t :: %__MODULE__{
          items: [Polarex.Generated.CustomerOrder.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [{Polarex.Generated.CustomerOrder, :t}],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

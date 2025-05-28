defmodule Polarex.ListResourceCustomerCustomerMeter do
  @moduledoc """
  Provides struct and type for a ListResourceCustomerCustomerMeter
  """

  @type t :: %__MODULE__{
          items: [Polarex.CustomerCustomerMeter.t()],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{Polarex.CustomerCustomerMeter, :t}], pagination: {Polarex.Pagination, :t}]
  end
end

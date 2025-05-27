defmodule Polarex.Generated.ListResourceEvent do
  @moduledoc """
  Provides struct and type for a ListResourceEvent
  """

  @type t :: %__MODULE__{
          items: [map | Polarex.Generated.UserEvent.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [union: [:map, {Polarex.Generated.UserEvent, :t}]],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

defmodule Polarex.ListResourceWithCursorPaginationEvent do
  @moduledoc """
  Provides struct and type for a ListResourceWithCursorPaginationEvent
  """

  @type t :: %__MODULE__{
          items: [map | Polarex.UserEvent.t()],
          pagination: Polarex.CursorPagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [union: [:map, {Polarex.UserEvent, :t}]], pagination: {Polarex.CursorPagination, :t}]
  end
end

defmodule Polarex.ListResourceEvent do
  @moduledoc """
  Provides struct and type for a ListResourceEvent
  """

  @type t :: %__MODULE__{items: [map | Polarex.UserEvent.t()], pagination: Polarex.Pagination.t()}

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [union: [:map, {Polarex.UserEvent, :t}]], pagination: {Polarex.Pagination, :t}]
  end
end

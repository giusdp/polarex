defmodule Polarex.CursorPagination do
  @moduledoc """
  Provides struct and type for a CursorPagination
  """

  @type t :: %__MODULE__{has_next_page: boolean}

  defstruct [:has_next_page]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [has_next_page: :boolean]
  end
end

defmodule Polarex.Pagination do
  @moduledoc """
  Provides struct and type for a Pagination
  """

  @type t :: %__MODULE__{max_page: integer, total_count: integer}

  defstruct [:max_page, :total_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_page: :integer, total_count: :integer]
  end
end

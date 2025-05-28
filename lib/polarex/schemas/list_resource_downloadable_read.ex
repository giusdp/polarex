defmodule Polarex.ListResourceDownloadableRead do
  @moduledoc """
  Provides struct and type for a ListResourceDownloadableRead
  """

  @type t :: %__MODULE__{
          items: [Polarex.DownloadableRead.t()],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{Polarex.DownloadableRead, :t}], pagination: {Polarex.Pagination, :t}]
  end
end

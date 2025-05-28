defmodule Polarex.ListResourceFileRead do
  @moduledoc """
  Provides struct and type for a ListResourceFileRead
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.DownloadableFileRead.t()
            | Polarex.OrganizationAvatarFileRead.t()
            | Polarex.ProductMediaFileRead.t()
          ],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.DownloadableFileRead, :t},
          {Polarex.OrganizationAvatarFileRead, :t},
          {Polarex.ProductMediaFileRead, :t}
        ]
      ],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

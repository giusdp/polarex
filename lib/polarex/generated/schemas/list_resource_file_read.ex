defmodule Polarex.Generated.ListResourceFileRead do
  @moduledoc """
  Provides struct and type for a ListResourceFileRead
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.Generated.DownloadableFileRead.t()
            | Polarex.Generated.OrganizationAvatarFileRead.t()
            | Polarex.Generated.ProductMediaFileRead.t()
          ],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.Generated.DownloadableFileRead, :t},
          {Polarex.Generated.OrganizationAvatarFileRead, :t},
          {Polarex.Generated.ProductMediaFileRead, :t}
        ]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

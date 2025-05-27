defmodule Polarex.Generated.ListResourceLicenseKeyRead do
  @moduledoc """
  Provides struct and type for a ListResourceLicenseKeyRead
  """

  @type t :: %__MODULE__{
          items: [Polarex.Generated.LicenseKeyRead.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [{Polarex.Generated.LicenseKeyRead, :t}],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

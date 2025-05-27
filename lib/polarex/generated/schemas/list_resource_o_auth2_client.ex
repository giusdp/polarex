defmodule Polarex.Generated.ListResourceOAuth2Client do
  @moduledoc """
  Provides struct and type for a ListResourceOAuth2Client
  """

  @type t :: %__MODULE__{
          items: [Polarex.Generated.OAuth2Client.t()],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [{Polarex.Generated.OAuth2Client, :t}],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

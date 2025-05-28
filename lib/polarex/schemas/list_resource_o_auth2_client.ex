defmodule Polarex.ListResourceOAuth2Client do
  @moduledoc """
  Provides struct and type for a ListResourceOAuth2Client
  """

  @type t :: %__MODULE__{items: [Polarex.OAuth2Client.t()], pagination: Polarex.Pagination.t()}

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{Polarex.OAuth2Client, :t}], pagination: {Polarex.Pagination, :t}]
  end
end

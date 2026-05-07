defmodule Polarex.OrganizationAccessTokenCreateResponse do
  @moduledoc """
  Provides struct and type for a OrganizationAccessTokenCreateResponse
  """

  @type t :: %__MODULE__{
          organization_access_token: Polarex.OrganizationAccessToken.t(),
          token: String.t()
        }

  defstruct [:organization_access_token, :token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization_access_token: {Polarex.OrganizationAccessToken, :t}, token: :string]
  end
end

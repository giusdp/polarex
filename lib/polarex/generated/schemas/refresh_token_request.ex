defmodule Polarex.Generated.RefreshTokenRequest do
  @moduledoc """
  Provides struct and type for a RefreshTokenRequest
  """

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_secret: String.t(),
          grant_type: String.t(),
          refresh_token: String.t()
        }

  defstruct [:client_id, :client_secret, :grant_type, :refresh_token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      grant_type: {:const, "refresh_token"},
      refresh_token: {:string, :generic}
    ]
  end
end

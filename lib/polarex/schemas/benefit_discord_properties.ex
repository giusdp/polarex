defmodule Polarex.BenefitDiscordProperties do
  @moduledoc """
  Provides struct and type for a BenefitDiscordProperties
  """

  @type t :: %__MODULE__{
          guild_id: String.t(),
          guild_token: String.t(),
          kick_member: boolean,
          role_id: String.t()
        }

  defstruct [:guild_id, :guild_token, :kick_member, :role_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      guild_id: {:string, :generic},
      guild_token: {:string, :generic},
      kick_member: :boolean,
      role_id: {:string, :generic}
    ]
  end
end

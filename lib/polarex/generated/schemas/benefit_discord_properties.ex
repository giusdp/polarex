defmodule Polarex.Generated.BenefitDiscordProperties do
  @moduledoc """
  Provides struct and type for a BenefitDiscordProperties
  """

  @type t :: %__MODULE__{guild_id: String.t(), guild_token: String.t(), role_id: String.t()}

  defstruct [:guild_id, :guild_token, :role_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      guild_id: {:string, :generic},
      guild_token: {:string, :generic},
      role_id: {:string, :generic}
    ]
  end
end

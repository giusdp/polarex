defmodule Polarex.BenefitDiscordCreateProperties do
  @moduledoc """
  Provides struct and type for a BenefitDiscordCreateProperties
  """

  @type t :: %__MODULE__{guild_token: String.t(), kick_member: boolean, role_id: String.t()}

  defstruct [:guild_token, :kick_member, :role_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [guild_token: :string, kick_member: :boolean, role_id: :string]
  end
end

defmodule Polarex.Generated.BenefitDiscordCreateProperties do
  @moduledoc """
  Provides struct and type for a BenefitDiscordCreateProperties
  """

  @type t :: %__MODULE__{guild_token: String.t(), role_id: String.t()}

  defstruct [:guild_token, :role_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [guild_token: {:string, :generic}, role_id: {:string, :generic}]
  end
end

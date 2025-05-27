defmodule Polarex.Generated.BenefitDiscordSubscriberProperties do
  @moduledoc """
  Provides struct and type for a BenefitDiscordSubscriberProperties
  """

  @type t :: %__MODULE__{guild_id: String.t()}

  defstruct [:guild_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [guild_id: {:string, :generic}]
  end
end

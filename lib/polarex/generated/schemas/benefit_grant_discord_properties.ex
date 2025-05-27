defmodule Polarex.Generated.BenefitGrantDiscordProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantDiscordProperties
  """

  @type t :: %__MODULE__{
          account_id: String.t() | nil,
          guild_id: String.t() | nil,
          role_id: String.t() | nil
        }

  defstruct [:account_id, :guild_id, :role_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [account_id: {:string, :generic}, guild_id: {:string, :generic}, role_id: {:string, :generic}]
  end
end

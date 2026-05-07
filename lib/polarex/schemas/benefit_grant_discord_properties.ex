defmodule Polarex.BenefitGrantDiscordProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantDiscordProperties
  """

  @type t :: %__MODULE__{
          account_id: String.t() | nil,
          granted_account_id: String.t() | nil,
          guild_id: String.t() | nil,
          role_id: String.t() | nil
        }

  defstruct [:account_id, :granted_account_id, :guild_id, :role_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account_id: {:union, [:string, :null]},
      granted_account_id: :string,
      guild_id: :string,
      role_id: :string
    ]
  end
end

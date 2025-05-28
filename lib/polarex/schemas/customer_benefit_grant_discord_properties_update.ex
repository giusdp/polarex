defmodule Polarex.CustomerBenefitGrantDiscordPropertiesUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantDiscordPropertiesUpdate
  """

  @type t :: %__MODULE__{account_id: String.t()}

  defstruct [:account_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [account_id: {:string, :generic}]
  end
end

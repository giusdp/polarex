defmodule Polarex.CustomerBenefitGrantDiscordUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantDiscordUpdate
  """

  @type t :: %__MODULE__{
          benefit_type: String.t(),
          properties: Polarex.CustomerBenefitGrantDiscordPropertiesUpdate.t()
        }

  defstruct [:benefit_type, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefit_type: {:const, "discord"},
      properties: {Polarex.CustomerBenefitGrantDiscordPropertiesUpdate, :t}
    ]
  end
end

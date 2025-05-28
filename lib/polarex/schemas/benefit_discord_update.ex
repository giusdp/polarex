defmodule Polarex.BenefitDiscordUpdate do
  @moduledoc """
  Provides struct and type for a BenefitDiscordUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          properties: Polarex.BenefitDiscordCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Metadata, :t},
      properties: {:union, [{Polarex.BenefitDiscordCreateProperties, :t}, :null]},
      type: {:const, "discord"}
    ]
  end
end

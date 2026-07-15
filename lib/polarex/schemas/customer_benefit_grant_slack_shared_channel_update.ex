defmodule Polarex.CustomerBenefitGrantSlackSharedChannelUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantSlackSharedChannelUpdate
  """

  @type t :: %__MODULE__{
          benefit_type: String.t(),
          properties: Polarex.CustomerBenefitGrantSlackSharedChannelPropertiesUpdate.t()
        }

  defstruct [:benefit_type, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefit_type: {:const, "slack_shared_channel"},
      properties: {Polarex.CustomerBenefitGrantSlackSharedChannelPropertiesUpdate, :t}
    ]
  end
end

defmodule Polarex.CustomerBenefitGrantSlackSharedChannelPropertiesUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantSlackSharedChannelPropertiesUpdate
  """

  @type t :: %__MODULE__{invited_email: String.t()}

  defstruct [:invited_email]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invited_email: {:string, "email"}]
  end
end

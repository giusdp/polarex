defmodule Polarex.CustomerBenefitGrantFeatureFlagUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantFeatureFlagUpdate
  """

  @type t :: %__MODULE__{benefit_type: String.t()}

  defstruct [:benefit_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [benefit_type: {:const, "feature_flag"}]
  end
end

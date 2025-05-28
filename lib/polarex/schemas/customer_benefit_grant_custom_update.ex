defmodule Polarex.CustomerBenefitGrantCustomUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantCustomUpdate
  """

  @type t :: %__MODULE__{benefit_type: String.t()}

  defstruct [:benefit_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [benefit_type: {:const, "custom"}]
  end
end

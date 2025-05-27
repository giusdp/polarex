defmodule Polarex.Generated.BenefitMeterCreditSubscriberProperties do
  @moduledoc """
  Provides struct and type for a BenefitMeterCreditSubscriberProperties
  """

  @type t :: %__MODULE__{meter_id: String.t(), rollover: boolean, units: integer}

  defstruct [:meter_id, :rollover, :units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meter_id: {:string, :generic}, rollover: :boolean, units: :integer]
  end
end

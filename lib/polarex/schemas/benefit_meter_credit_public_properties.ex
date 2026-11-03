defmodule Polarex.BenefitMeterCreditPublicProperties do
  @moduledoc """
  Provides struct and type for a BenefitMeterCreditPublicProperties
  """

  @type t :: %__MODULE__{meter_id: String.t(), units: integer}

  defstruct [:meter_id, :units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meter_id: {:string, "uuid4"}, units: :integer]
  end
end

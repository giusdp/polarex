defmodule Polarex.Generated.BenefitGrantMeterCreditProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantMeterCreditProperties
  """

  @type t :: %__MODULE__{
          last_credited_at: String.t(),
          last_credited_meter_id: String.t(),
          last_credited_units: integer
        }

  defstruct [:last_credited_at, :last_credited_meter_id, :last_credited_units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      last_credited_at: {:string, :generic},
      last_credited_meter_id: {:string, :generic},
      last_credited_units: :integer
    ]
  end
end

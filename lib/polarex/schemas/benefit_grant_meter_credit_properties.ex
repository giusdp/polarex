defmodule Polarex.BenefitGrantMeterCreditProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantMeterCreditProperties
  """

  @type t :: %__MODULE__{
          last_credited_at: String.t() | nil,
          last_credited_meter_id: String.t() | nil,
          last_credited_units: integer | nil
        }

  defstruct [:last_credited_at, :last_credited_meter_id, :last_credited_units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [last_credited_at: :string, last_credited_meter_id: :string, last_credited_units: :integer]
  end
end

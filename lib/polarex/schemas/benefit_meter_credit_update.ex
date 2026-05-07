defmodule Polarex.BenefitMeterCreditUpdate do
  @moduledoc """
  Provides struct and type for a BenefitMeterCreditUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: map | nil,
          properties: Polarex.BenefitMeterCreditCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [:string, :null]},
      metadata: :map,
      properties: {:union, [{Polarex.BenefitMeterCreditCreateProperties, :t}, :null]},
      type: {:const, "meter_credit"}
    ]
  end
end

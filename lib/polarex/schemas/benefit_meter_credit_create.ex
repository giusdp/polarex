defmodule Polarex.BenefitMeterCreditCreate do
  @moduledoc """
  Provides struct and type for a BenefitMeterCreditCreate
  """

  @type t :: %__MODULE__{
          description: String.t(),
          metadata: Polarex.Metadata.t() | nil,
          organization_id: String.t() | nil,
          properties: Polarex.BenefitMeterCreditCreateProperties.t(),
          type: String.t()
        }

  defstruct [:description, :metadata, :organization_id, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      organization_id: {:union, [{:string, :generic}, :null]},
      properties: {Polarex.BenefitMeterCreditCreateProperties, :t},
      type: {:const, "meter_credit"}
    ]
  end
end

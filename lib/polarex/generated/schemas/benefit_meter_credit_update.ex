defmodule Polarex.Generated.BenefitMeterCreditUpdate do
  @moduledoc """
  Provides struct and type for a BenefitMeterCreditUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          properties: Polarex.Generated.BenefitMeterCreditCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      properties: {:union, [{Polarex.Generated.BenefitMeterCreditCreateProperties, :t}, :null]},
      type: {:const, "meter_credit"}
    ]
  end
end

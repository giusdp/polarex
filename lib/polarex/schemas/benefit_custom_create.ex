defmodule Polarex.BenefitCustomCreate do
  @moduledoc """
  Provides struct and type for a BenefitCustomCreate
  """

  @type t :: %__MODULE__{
          description: String.t(),
          metadata: Polarex.Metadata.t() | nil,
          organization_id: String.t() | nil,
          properties: Polarex.BenefitCustomCreateProperties.t(),
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
      properties: {Polarex.BenefitCustomCreateProperties, :t},
      type: {:const, "custom"}
    ]
  end
end

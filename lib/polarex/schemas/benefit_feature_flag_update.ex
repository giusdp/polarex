defmodule Polarex.BenefitFeatureFlagUpdate do
  @moduledoc """
  Provides struct and type for a BenefitFeatureFlagUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: map | nil,
          properties: map | nil,
          type: String.t(),
          visibility: String.t() | nil
        }

  defstruct [:description, :metadata, :properties, :type, :visibility]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [:string, :null]},
      metadata: :map,
      properties: {:union, [:map, :null]},
      type: {:const, "feature_flag"},
      visibility: {:union, [{:enum, ["draft", "private", "public"]}, :null]}
    ]
  end
end

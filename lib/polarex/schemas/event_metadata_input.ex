defmodule Polarex.EventMetadataInput do
  @moduledoc """
  Provides struct and type for a EventMetadataInput
  """

  @type t :: %__MODULE__{
          cost: Polarex.CostMetadataInput.t() | nil,
          llm: Polarex.LLMMetadata.t() | nil
        }

  defstruct [:cost, :llm]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cost: {Polarex.CostMetadataInput, :t}, llm: {Polarex.LLMMetadata, :t}]
  end
end

defmodule Polarex.EventMetadataOutput do
  @moduledoc """
  Provides struct and type for a EventMetadataOutput
  """

  @type t :: %__MODULE__{
          cost: Polarex.CostMetadataOutput.t() | nil,
          llm: Polarex.LLMMetadata.t() | nil
        }

  defstruct [:cost, :llm]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cost: {Polarex.CostMetadataOutput, :t}, llm: {Polarex.LLMMetadata, :t}]
  end
end

defmodule Polarex.Generated.BenefitGrantError do
  @moduledoc """
  Provides struct and type for a BenefitGrantError
  """

  @type t :: %__MODULE__{message: String.t(), timestamp: String.t(), type: String.t()}

  defstruct [:message, :timestamp, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:string, :generic}, timestamp: {:string, :generic}, type: {:string, :generic}]
  end
end

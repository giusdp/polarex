defmodule Polarex.Generated.CustomFieldSelectOption do
  @moduledoc """
  Provides struct and type for a CustomFieldSelectOption
  """

  @type t :: %__MODULE__{label: String.t(), value: String.t()}

  defstruct [:label, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: {:string, :generic}, value: {:string, :generic}]
  end
end

defmodule Polarex.Metric do
  @moduledoc """
  Provides struct and type for a Metric
  """

  @type t :: %__MODULE__{display_name: String.t(), slug: String.t(), type: String.t()}

  defstruct [:display_name, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: {:string, :generic},
      slug: {:string, :generic},
      type: {:enum, ["scalar", "currency", "percentage"]}
    ]
  end
end

defmodule Polarex.Generated.MetricsLimits do
  @moduledoc """
  Provides struct and type for a MetricsLimits
  """

  @type t :: %__MODULE__{
          intervals: Polarex.Generated.MetricsIntervalsLimits.t(),
          min_date: Date.t()
        }

  defstruct [:intervals, :min_date]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [intervals: {Polarex.Generated.MetricsIntervalsLimits, :t}, min_date: {:string, :date}]
  end
end

defmodule Polarex.MetricsIntervalsLimits do
  @moduledoc """
  Provides struct and type for a MetricsIntervalsLimits
  """

  @type t :: %__MODULE__{
          day: Polarex.MetricsIntervalLimit.t(),
          hour: Polarex.MetricsIntervalLimit.t(),
          month: Polarex.MetricsIntervalLimit.t(),
          week: Polarex.MetricsIntervalLimit.t(),
          year: Polarex.MetricsIntervalLimit.t()
        }

  defstruct [:day, :hour, :month, :week, :year]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      day: {Polarex.MetricsIntervalLimit, :t},
      hour: {Polarex.MetricsIntervalLimit, :t},
      month: {Polarex.MetricsIntervalLimit, :t},
      week: {Polarex.MetricsIntervalLimit, :t},
      year: {Polarex.MetricsIntervalLimit, :t}
    ]
  end
end

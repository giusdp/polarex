defmodule Polarex.Generated.MetricsIntervalsLimits do
  @moduledoc """
  Provides struct and type for a MetricsIntervalsLimits
  """

  @type t :: %__MODULE__{
          day: Polarex.Generated.MetricsIntervalLimit.t(),
          hour: Polarex.Generated.MetricsIntervalLimit.t(),
          month: Polarex.Generated.MetricsIntervalLimit.t(),
          week: Polarex.Generated.MetricsIntervalLimit.t(),
          year: Polarex.Generated.MetricsIntervalLimit.t()
        }

  defstruct [:day, :hour, :month, :week, :year]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      day: {Polarex.Generated.MetricsIntervalLimit, :t},
      hour: {Polarex.Generated.MetricsIntervalLimit, :t},
      month: {Polarex.Generated.MetricsIntervalLimit, :t},
      week: {Polarex.Generated.MetricsIntervalLimit, :t},
      year: {Polarex.Generated.MetricsIntervalLimit, :t}
    ]
  end
end

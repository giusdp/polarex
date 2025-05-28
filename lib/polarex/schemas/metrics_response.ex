defmodule Polarex.MetricsResponse do
  @moduledoc """
  Provides struct and type for a MetricsResponse
  """

  @type t :: %__MODULE__{
          metrics: Polarex.Metrics.t(),
          periods: [Polarex.MetricPeriod.t()],
          totals: Polarex.MetricsTotals.t()
        }

  defstruct [:metrics, :periods, :totals]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metrics: {Polarex.Metrics, :t},
      periods: [{Polarex.MetricPeriod, :t}],
      totals: {Polarex.MetricsTotals, :t}
    ]
  end
end

defmodule Polarex.Generated.MetricsResponse do
  @moduledoc """
  Provides struct and type for a MetricsResponse
  """

  @type t :: %__MODULE__{
          metrics: Polarex.Generated.Metrics.t(),
          periods: [Polarex.Generated.MetricPeriod.t()],
          totals: Polarex.Generated.MetricsTotals.t()
        }

  defstruct [:metrics, :periods, :totals]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metrics: {Polarex.Generated.Metrics, :t},
      periods: [{Polarex.Generated.MetricPeriod, :t}],
      totals: {Polarex.Generated.MetricsTotals, :t}
    ]
  end
end

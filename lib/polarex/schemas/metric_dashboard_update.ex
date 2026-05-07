defmodule Polarex.MetricDashboardUpdate do
  @moduledoc """
  Provides struct and type for a MetricDashboardUpdate
  """

  @type t :: %__MODULE__{metrics: [String.t()] | nil, name: String.t() | nil}

  defstruct [:metrics, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metrics: {:union, [[:string], :null]}, name: {:union, [:string, :null]}]
  end
end

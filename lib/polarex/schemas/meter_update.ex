defmodule Polarex.MeterUpdate do
  @moduledoc """
  Provides struct and type for a MeterUpdate
  """

  @type t :: %__MODULE__{
          aggregation: Polarex.CountAggregation.t() | Polarex.PropertyAggregation.t() | nil,
          filter: Polarex.Filter.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          name: String.t() | nil
        }

  defstruct [:aggregation, :filter, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation:
        {:union, [{Polarex.CountAggregation, :t}, {Polarex.PropertyAggregation, :t}, :null]},
      filter: {:union, [{Polarex.Filter, :t}, :null]},
      metadata: {Polarex.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]}
    ]
  end
end

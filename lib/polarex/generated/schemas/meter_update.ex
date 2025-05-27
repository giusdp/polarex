defmodule Polarex.Generated.MeterUpdate do
  @moduledoc """
  Provides struct and type for a MeterUpdate
  """

  @type t :: %__MODULE__{
          aggregation:
            Polarex.Generated.CountAggregation.t()
            | Polarex.Generated.PropertyAggregation.t()
            | nil,
          filter: Polarex.Generated.Filter.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t() | nil
        }

  defstruct [:aggregation, :filter, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation:
        {:union,
         [
           {Polarex.Generated.CountAggregation, :t},
           {Polarex.Generated.PropertyAggregation, :t},
           :null
         ]},
      filter: {:union, [{Polarex.Generated.Filter, :t}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]}
    ]
  end
end

defmodule Polarex.MeterCreate do
  @moduledoc """
  Provides struct and type for a MeterCreate
  """

  @type t :: %__MODULE__{
          aggregation: Polarex.CountAggregation.t() | Polarex.PropertyAggregation.t(),
          filter: Polarex.Filter.t(),
          metadata: Polarex.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil
        }

  defstruct [:aggregation, :filter, :metadata, :name, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation: {:union, [{Polarex.CountAggregation, :t}, {Polarex.PropertyAggregation, :t}]},
      filter: {Polarex.Filter, :t},
      metadata: {Polarex.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

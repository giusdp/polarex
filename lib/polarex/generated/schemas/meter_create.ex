defmodule Polarex.Generated.MeterCreate do
  @moduledoc """
  Provides struct and type for a MeterCreate
  """

  @type t :: %__MODULE__{
          aggregation:
            Polarex.Generated.CountAggregation.t() | Polarex.Generated.PropertyAggregation.t(),
          filter: Polarex.Generated.Filter.t(),
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil
        }

  defstruct [:aggregation, :filter, :metadata, :name, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation:
        {:union,
         [{Polarex.Generated.CountAggregation, :t}, {Polarex.Generated.PropertyAggregation, :t}]},
      filter: {Polarex.Generated.Filter, :t},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

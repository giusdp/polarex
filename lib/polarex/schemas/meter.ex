defmodule Polarex.Meter do
  @moduledoc """
  Provides struct and type for a Meter
  """

  @type t :: %__MODULE__{
          aggregation: Polarex.CountAggregation.t() | Polarex.PropertyAggregation.t(),
          created_at: DateTime.t(),
          filter: Polarex.Filter.t(),
          id: String.t(),
          metadata: Polarex.Metadata.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t()
        }

  defstruct [
    :aggregation,
    :created_at,
    :filter,
    :id,
    :metadata,
    :modified_at,
    :name,
    :organization_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation: {:union, [{Polarex.CountAggregation, :t}, {Polarex.PropertyAggregation, :t}]},
      created_at: {:string, :date_time},
      filter: {Polarex.Filter, :t},
      id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization_id: {:string, :generic}
    ]
  end
end

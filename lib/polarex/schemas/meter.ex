defmodule Polarex.Meter do
  @moduledoc """
  Provides struct and type for a Meter
  """

  @type t :: %__MODULE__{
          aggregation:
            Polarex.CountAggregation.t()
            | Polarex.PropertyAggregation.t()
            | Polarex.UniqueAggregation.t(),
          archived_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          custom_label: String.t() | nil,
          custom_multiplier: integer | nil,
          filter: Polarex.Filter.t(),
          id: String.t(),
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          unit: String.t()
        }

  defstruct [
    :aggregation,
    :archived_at,
    :created_at,
    :custom_label,
    :custom_multiplier,
    :filter,
    :id,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :unit
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation:
        {:union,
         [
           {Polarex.CountAggregation, :t},
           {Polarex.PropertyAggregation, :t},
           {Polarex.UniqueAggregation, :t}
         ]},
      archived_at: {:union, [{:string, "date-time"}, :null]},
      created_at: {:string, "date-time"},
      custom_label: {:union, [:string, :null]},
      custom_multiplier: {:union, [:integer, :null]},
      filter: {Polarex.Filter, :t},
      id: {:string, "uuid4"},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"},
      unit: {:enum, ["scalar", "token", "custom"]}
    ]
  end
end

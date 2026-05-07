defmodule Polarex.MeterUpdate do
  @moduledoc """
  Provides struct and type for a MeterUpdate
  """

  @type t :: %__MODULE__{
          aggregation:
            Polarex.CountAggregation.t()
            | Polarex.PropertyAggregation.t()
            | Polarex.UniqueAggregation.t()
            | nil,
          custom_label: String.t() | nil,
          custom_multiplier: integer | nil,
          filter: Polarex.Filter.t() | nil,
          is_archived: boolean | nil,
          metadata: map | nil,
          name: String.t() | nil,
          unit: String.t() | nil
        }

  defstruct [
    :aggregation,
    :custom_label,
    :custom_multiplier,
    :filter,
    :is_archived,
    :metadata,
    :name,
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
           {Polarex.UniqueAggregation, :t},
           :null
         ]},
      custom_label: {:union, [:string, :null]},
      custom_multiplier: {:union, [:integer, :null]},
      filter: {:union, [{Polarex.Filter, :t}, :null]},
      is_archived: {:union, [:boolean, :null]},
      metadata: :map,
      name: {:union, [:string, :null]},
      unit: {:union, [{:enum, ["scalar", "token", "custom"]}, :null]}
    ]
  end
end

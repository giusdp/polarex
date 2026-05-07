defmodule Polarex.MeterCreate do
  @moduledoc """
  Provides struct and type for a MeterCreate
  """

  @type t :: %__MODULE__{
          aggregation:
            Polarex.CountAggregation.t()
            | Polarex.PropertyAggregation.t()
            | Polarex.UniqueAggregation.t(),
          custom_label: String.t() | nil,
          custom_multiplier: integer | nil,
          filter: Polarex.Filter.t(),
          metadata: map | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          unit: String.t() | nil
        }

  defstruct [
    :aggregation,
    :custom_label,
    :custom_multiplier,
    :filter,
    :metadata,
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
      custom_label: {:union, [:string, :null]},
      custom_multiplier: {:union, [:integer, :null]},
      filter: {Polarex.Filter, :t},
      metadata: :map,
      name: :string,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      unit: {:enum, ["scalar", "token", "custom"]}
    ]
  end
end

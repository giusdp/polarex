defmodule Polarex.ProductUpdate do
  @moduledoc """
  Provides struct and type for a ProductUpdate
  """

  @type t :: %__MODULE__{
          attached_custom_fields: [Polarex.AttachedCustomFieldCreate.t()] | nil,
          description: String.t() | nil,
          is_archived: boolean | nil,
          medias: [String.t()] | nil,
          metadata: map | nil,
          name: String.t() | nil,
          prices:
            [
              map
              | Polarex.ProductPriceCustomCreate.t()
              | Polarex.ProductPriceFixedCreate.t()
              | Polarex.ProductPriceMeteredUnitCreate.t()
              | Polarex.ProductPriceSeatBasedCreate.t()
            ]
            | nil,
          recurring_interval: String.t() | nil,
          recurring_interval_count: integer | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil,
          visibility: String.t() | nil
        }

  defstruct [
    :attached_custom_fields,
    :description,
    :is_archived,
    :medias,
    :metadata,
    :name,
    :prices,
    :recurring_interval,
    :recurring_interval_count,
    :trial_interval,
    :trial_interval_count,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attached_custom_fields: {:union, [[{Polarex.AttachedCustomFieldCreate, :t}], :null]},
      description: {:union, [:string, :null]},
      is_archived: {:union, [:boolean, :null]},
      medias: {:union, [[string: "uuid4"], :null]},
      metadata: :map,
      name: {:union, [:string, :null]},
      prices:
        {:union,
         [
           [
             union: [
               :map,
               {Polarex.ProductPriceCustomCreate, :t},
               {Polarex.ProductPriceFixedCreate, :t},
               {Polarex.ProductPriceMeteredUnitCreate, :t},
               {Polarex.ProductPriceSeatBasedCreate, :t}
             ]
           ],
           :null
         ]},
      recurring_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      recurring_interval_count: {:union, [:integer, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      visibility: {:union, [{:enum, ["draft", "private", "public"]}, :null]}
    ]
  end
end

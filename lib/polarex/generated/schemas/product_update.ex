defmodule Polarex.Generated.ProductUpdate do
  @moduledoc """
  Provides struct and type for a ProductUpdate
  """

  @type t :: %__MODULE__{
          attached_custom_fields: [Polarex.Generated.AttachedCustomFieldCreate.t()] | nil,
          description: String.t() | nil,
          is_archived: boolean | nil,
          medias: [String.t()] | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t() | nil,
          prices:
            [
              map
              | Polarex.Generated.ProductPriceCustomCreate.t()
              | Polarex.Generated.ProductPriceFixedCreate.t()
              | Polarex.Generated.ProductPriceFreeCreate.t()
              | Polarex.Generated.ProductPriceMeteredUnitCreate.t()
            ]
            | nil,
          recurring_interval: String.t() | nil
        }

  defstruct [
    :attached_custom_fields,
    :description,
    :is_archived,
    :medias,
    :metadata,
    :name,
    :prices,
    :recurring_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attached_custom_fields:
        {:union, [[{Polarex.Generated.AttachedCustomFieldCreate, :t}], :null]},
      description: {:union, [{:string, :generic}, :null]},
      is_archived: {:union, [:boolean, :null]},
      medias: {:union, [[string: :generic], :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]},
      prices:
        {:union,
         [
           [
             union: [
               :map,
               {Polarex.Generated.ProductPriceCustomCreate, :t},
               {Polarex.Generated.ProductPriceFixedCreate, :t},
               {Polarex.Generated.ProductPriceFreeCreate, :t},
               {Polarex.Generated.ProductPriceMeteredUnitCreate, :t}
             ]
           ],
           :null
         ]},
      recurring_interval: {:union, [{:enum, ["month", "year"]}, :null]}
    ]
  end
end

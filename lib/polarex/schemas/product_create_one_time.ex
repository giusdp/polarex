defmodule Polarex.ProductCreateOneTime do
  @moduledoc """
  Provides struct and type for a ProductCreateOneTime
  """

  @type t :: %__MODULE__{
          attached_custom_fields: [Polarex.AttachedCustomFieldCreate.t()] | nil,
          description: String.t() | nil,
          medias: [String.t()] | nil,
          metadata: Polarex.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          prices: [
            Polarex.ProductPriceCustomCreate.t()
            | Polarex.ProductPriceFixedCreate.t()
            | Polarex.ProductPriceFreeCreate.t()
            | Polarex.ProductPriceMeteredUnitCreate.t()
            | Polarex.ProductPriceSeatBasedCreate.t()
          ],
          recurring_interval: nil,
          recurring_interval_count: nil
        }

  defstruct [
    :attached_custom_fields,
    :description,
    :medias,
    :metadata,
    :name,
    :organization_id,
    :prices,
    :recurring_interval,
    :recurring_interval_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attached_custom_fields: [{Polarex.AttachedCustomFieldCreate, :t}],
      description: {:union, [{:string, :generic}, :null]},
      medias: {:union, [[string: :generic], :null]},
      metadata: {Polarex.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      prices: [
        union: [
          {Polarex.ProductPriceCustomCreate, :t},
          {Polarex.ProductPriceFixedCreate, :t},
          {Polarex.ProductPriceFreeCreate, :t},
          {Polarex.ProductPriceMeteredUnitCreate, :t},
          {Polarex.ProductPriceSeatBasedCreate, :t}
        ]
      ],
      recurring_interval: :null,
      recurring_interval_count: :null
    ]
  end
end

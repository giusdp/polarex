defmodule Polarex.Generated.ProductCreate do
  @moduledoc """
  Provides struct and type for a ProductCreate
  """

  @type t :: %__MODULE__{
          attached_custom_fields: [Polarex.Generated.AttachedCustomFieldCreate.t()] | nil,
          description: String.t() | nil,
          medias: [String.t()] | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          prices: [
            Polarex.Generated.ProductPriceCustomCreate.t()
            | Polarex.Generated.ProductPriceFixedCreate.t()
            | Polarex.Generated.ProductPriceFreeCreate.t()
            | Polarex.Generated.ProductPriceMeteredUnitCreate.t()
          ],
          recurring_interval: String.t() | nil
        }

  defstruct [
    :attached_custom_fields,
    :description,
    :medias,
    :metadata,
    :name,
    :organization_id,
    :prices,
    :recurring_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attached_custom_fields: [{Polarex.Generated.AttachedCustomFieldCreate, :t}],
      description: {:union, [{:string, :generic}, :null]},
      medias: {:union, [[string: :generic], :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      prices: [
        union: [
          {Polarex.Generated.ProductPriceCustomCreate, :t},
          {Polarex.Generated.ProductPriceFixedCreate, :t},
          {Polarex.Generated.ProductPriceFreeCreate, :t},
          {Polarex.Generated.ProductPriceMeteredUnitCreate, :t}
        ]
      ],
      recurring_interval: {:union, [{:enum, ["month", "year"]}, :null]}
    ]
  end
end

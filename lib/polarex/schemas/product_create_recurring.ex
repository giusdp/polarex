defmodule Polarex.ProductCreateRecurring do
  @moduledoc """
  Provides struct and type for a ProductCreateRecurring
  """

  @type t :: %__MODULE__{
          attached_custom_fields: [Polarex.AttachedCustomFieldCreate.t()] | nil,
          description: String.t() | nil,
          medias: [String.t()] | nil,
          metadata: map | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          prices: [
            Polarex.ProductPriceCustomCreate.t()
            | Polarex.ProductPriceFixedCreate.t()
            | Polarex.ProductPriceFreeCreate.t()
            | Polarex.ProductPriceMeteredUnitCreate.t()
            | Polarex.ProductPriceSeatBasedCreate.t()
          ],
          recurring_interval: String.t(),
          recurring_interval_count: integer | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil,
          visibility: String.t() | nil
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
      attached_custom_fields: [{Polarex.AttachedCustomFieldCreate, :t}],
      description: {:union, [:string, :null]},
      medias: {:union, [[string: "uuid4"], :null]},
      metadata: :map,
      name: :string,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      prices: [
        union: [
          {Polarex.ProductPriceCustomCreate, :t},
          {Polarex.ProductPriceFixedCreate, :t},
          {Polarex.ProductPriceFreeCreate, :t},
          {Polarex.ProductPriceMeteredUnitCreate, :t},
          {Polarex.ProductPriceSeatBasedCreate, :t}
        ]
      ],
      recurring_interval: {:enum, ["day", "week", "month", "year"]},
      recurring_interval_count: :integer,
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      visibility: {:enum, ["draft", "private", "public"]}
    ]
  end
end

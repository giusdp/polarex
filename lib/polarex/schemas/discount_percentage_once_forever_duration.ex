defmodule Polarex.DiscountPercentageOnceForeverDuration do
  @moduledoc """
  Provides struct and type for a DiscountPercentageOnceForeverDuration
  """

  @type t :: %__MODULE__{
          basis_points: integer,
          code: String.t() | nil,
          created_at: DateTime.t(),
          duration: String.t(),
          ends_at: DateTime.t() | nil,
          id: String.t(),
          max_redemptions: integer | nil,
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          products: [Polarex.DiscountProduct.t()],
          redemptions_count: integer,
          starts_at: DateTime.t() | nil,
          type: String.t()
        }

  defstruct [
    :basis_points,
    :code,
    :created_at,
    :duration,
    :ends_at,
    :id,
    :max_redemptions,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :products,
    :redemptions_count,
    :starts_at,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      basis_points: :integer,
      code: {:union, [:string, :null]},
      created_at: {:string, "date-time"},
      duration: {:enum, ["once", "forever", "repeating"]},
      ends_at: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      max_redemptions: {:union, [:integer, :null]},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"},
      products: [{Polarex.DiscountProduct, :t}],
      redemptions_count: :integer,
      starts_at: {:union, [{:string, "date-time"}, :null]},
      type: {:enum, ["fixed", "percentage"]}
    ]
  end
end

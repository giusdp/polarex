defmodule Polarex.DiscountFixedRepeatDuration do
  @moduledoc """
  Provides struct and type for a DiscountFixedRepeatDuration
  """

  @type t :: %__MODULE__{
          amount: integer,
          amounts: map,
          code: String.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          duration: String.t(),
          duration_in_months: integer,
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
    :amount,
    :amounts,
    :code,
    :created_at,
    :currency,
    :duration,
    :duration_in_months,
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
      amount: :integer,
      amounts: :map,
      code: {:union, [:string, :null]},
      created_at: {:string, "date-time"},
      currency: :string,
      duration: {:enum, ["once", "forever", "repeating"]},
      duration_in_months: :integer,
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

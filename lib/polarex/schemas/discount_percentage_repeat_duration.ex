defmodule Polarex.DiscountPercentageRepeatDuration do
  @moduledoc """
  Provides struct and type for a DiscountPercentageRepeatDuration
  """

  @type t :: %__MODULE__{
          basis_points: integer,
          code: String.t() | nil,
          created_at: DateTime.t(),
          duration: String.t(),
          duration_in_months: integer,
          ends_at: DateTime.t() | nil,
          id: String.t(),
          max_redemptions: integer | nil,
          metadata: Polarex.Metadata.t(),
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
      basis_points: :integer,
      code: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      duration: {:enum, ["once", "forever", "repeating"]},
      duration_in_months: :integer,
      ends_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      max_redemptions: {:union, [:integer, :null]},
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      products: [{Polarex.DiscountProduct, :t}],
      redemptions_count: :integer,
      starts_at: {:union, [{:string, :date_time}, :null]},
      type: {:enum, ["fixed", "percentage"]}
    ]
  end
end

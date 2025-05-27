defmodule Polarex.Generated.DiscountPercentageOnceForeverDurationCreate do
  @moduledoc """
  Provides struct and type for a DiscountPercentageOnceForeverDurationCreate
  """

  @type t :: %__MODULE__{
          basis_points: integer,
          code: String.t() | nil,
          duration: String.t(),
          ends_at: DateTime.t() | nil,
          max_redemptions: integer | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          products: [String.t()] | nil,
          starts_at: DateTime.t() | nil,
          type: String.t()
        }

  defstruct [
    :basis_points,
    :code,
    :duration,
    :ends_at,
    :max_redemptions,
    :metadata,
    :name,
    :organization_id,
    :products,
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
      duration: {:enum, ["once", "forever", "repeating"]},
      ends_at: {:union, [{:string, :date_time}, :null]},
      max_redemptions: {:union, [:integer, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      products: {:union, [[string: :generic], :null]},
      starts_at: {:union, [{:string, :date_time}, :null]},
      type: {:enum, ["fixed", "percentage"]}
    ]
  end
end

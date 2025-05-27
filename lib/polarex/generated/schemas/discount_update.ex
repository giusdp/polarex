defmodule Polarex.Generated.DiscountUpdate do
  @moduledoc """
  Provides struct and type for a DiscountUpdate
  """

  @type t :: %__MODULE__{
          amount: integer | nil,
          basis_points: integer | nil,
          code: String.t() | nil,
          currency: String.t() | nil,
          duration: String.t() | nil,
          duration_in_months: integer | nil,
          ends_at: DateTime.t() | nil,
          max_redemptions: integer | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          name: String.t() | nil,
          products: [String.t()] | nil,
          starts_at: DateTime.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :amount,
    :basis_points,
    :code,
    :currency,
    :duration,
    :duration_in_months,
    :ends_at,
    :max_redemptions,
    :metadata,
    :name,
    :products,
    :starts_at,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {:union, [:integer, :null]},
      basis_points: {:union, [:integer, :null]},
      code: {:union, [{:string, :generic}, :null]},
      currency: {:union, [{:string, :generic}, :null]},
      duration: {:union, [{:enum, ["once", "forever", "repeating"]}, :null]},
      duration_in_months: {:union, [:integer, :null]},
      ends_at: {:union, [{:string, :date_time}, :null]},
      max_redemptions: {:union, [:integer, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      name: {:union, [{:string, :generic}, :null]},
      products: {:union, [[string: :generic], :null]},
      starts_at: {:union, [{:string, :date_time}, :null]},
      type: {:union, [{:enum, ["fixed", "percentage"]}, :null]}
    ]
  end
end

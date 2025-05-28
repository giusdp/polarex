defmodule Polarex.DiscountFixedRepeatDurationCreate do
  @moduledoc """
  Provides struct and type for a DiscountFixedRepeatDurationCreate
  """

  @type t :: %__MODULE__{
          amount: integer,
          code: String.t() | nil,
          currency: String.t() | nil,
          duration: String.t(),
          duration_in_months: integer,
          ends_at: DateTime.t() | nil,
          max_redemptions: integer | nil,
          metadata: Polarex.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          products: [String.t()] | nil,
          starts_at: DateTime.t() | nil,
          type: String.t()
        }

  defstruct [
    :amount,
    :code,
    :currency,
    :duration,
    :duration_in_months,
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
      amount: :integer,
      code: {:union, [{:string, :generic}, :null]},
      currency: {:string, :generic},
      duration: {:enum, ["once", "forever", "repeating"]},
      duration_in_months: :integer,
      ends_at: {:union, [{:string, :date_time}, :null]},
      max_redemptions: {:union, [:integer, :null]},
      metadata: {Polarex.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      products: {:union, [[string: :generic], :null]},
      starts_at: {:union, [{:string, :date_time}, :null]},
      type: {:enum, ["fixed", "percentage"]}
    ]
  end
end

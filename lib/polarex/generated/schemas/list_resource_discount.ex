defmodule Polarex.Generated.ListResourceDiscount do
  @moduledoc """
  Provides struct and type for a ListResourceDiscount
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.Generated.DiscountFixedOnceForeverDuration.t()
            | Polarex.Generated.DiscountFixedRepeatDuration.t()
            | Polarex.Generated.DiscountPercentageOnceForeverDuration.t()
            | Polarex.Generated.DiscountPercentageRepeatDuration.t()
          ],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.Generated.DiscountFixedOnceForeverDuration, :t},
          {Polarex.Generated.DiscountFixedRepeatDuration, :t},
          {Polarex.Generated.DiscountPercentageOnceForeverDuration, :t},
          {Polarex.Generated.DiscountPercentageRepeatDuration, :t}
        ]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

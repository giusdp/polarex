defmodule Polarex.ListResourceDiscount do
  @moduledoc """
  Provides struct and type for a ListResourceDiscount
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.DiscountFixedOnceForeverDuration.t()
            | Polarex.DiscountFixedRepeatDuration.t()
            | Polarex.DiscountPercentageOnceForeverDuration.t()
            | Polarex.DiscountPercentageRepeatDuration.t()
          ],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.DiscountFixedOnceForeverDuration, :t},
          {Polarex.DiscountFixedRepeatDuration, :t},
          {Polarex.DiscountPercentageOnceForeverDuration, :t},
          {Polarex.DiscountPercentageRepeatDuration, :t}
        ]
      ],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

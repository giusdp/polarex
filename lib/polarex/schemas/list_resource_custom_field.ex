defmodule Polarex.ListResourceCustomField do
  @moduledoc """
  Provides struct and type for a ListResourceCustomField
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.CustomFieldCheckbox.t()
            | Polarex.CustomFieldDate.t()
            | Polarex.CustomFieldNumber.t()
            | Polarex.CustomFieldSelect.t()
            | Polarex.CustomFieldText.t()
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
          {Polarex.CustomFieldCheckbox, :t},
          {Polarex.CustomFieldDate, :t},
          {Polarex.CustomFieldNumber, :t},
          {Polarex.CustomFieldSelect, :t},
          {Polarex.CustomFieldText, :t}
        ]
      ],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

defmodule Polarex.Generated.ListResourceCustomField do
  @moduledoc """
  Provides struct and type for a ListResourceCustomField
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.Generated.CustomFieldCheckbox.t()
            | Polarex.Generated.CustomFieldDate.t()
            | Polarex.Generated.CustomFieldNumber.t()
            | Polarex.Generated.CustomFieldSelect.t()
            | Polarex.Generated.CustomFieldText.t()
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
          {Polarex.Generated.CustomFieldCheckbox, :t},
          {Polarex.Generated.CustomFieldDate, :t},
          {Polarex.Generated.CustomFieldNumber, :t},
          {Polarex.Generated.CustomFieldSelect, :t},
          {Polarex.Generated.CustomFieldText, :t}
        ]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

defmodule Polarex.AttachedCustomField do
  @moduledoc """
  Provides struct and type for a AttachedCustomField
  """

  @type t :: %__MODULE__{
          custom_field:
            Polarex.CustomFieldCheckbox.t()
            | Polarex.CustomFieldDate.t()
            | Polarex.CustomFieldNumber.t()
            | Polarex.CustomFieldSelect.t()
            | Polarex.CustomFieldText.t(),
          custom_field_id: String.t(),
          order: integer,
          required: boolean
        }

  defstruct [:custom_field, :custom_field_id, :order, :required]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_field:
        {:union,
         [
           {Polarex.CustomFieldCheckbox, :t},
           {Polarex.CustomFieldDate, :t},
           {Polarex.CustomFieldNumber, :t},
           {Polarex.CustomFieldSelect, :t},
           {Polarex.CustomFieldText, :t}
         ]},
      custom_field_id: {:string, :generic},
      order: :integer,
      required: :boolean
    ]
  end
end

defmodule Polarex.Generated.CustomFieldTextProperties do
  @moduledoc """
  Provides struct and type for a CustomFieldTextProperties
  """

  @type t :: %__MODULE__{
          form_help_text: String.t() | nil,
          form_label: String.t() | nil,
          form_placeholder: String.t() | nil,
          max_length: integer | nil,
          min_length: integer | nil,
          textarea: boolean | nil
        }

  defstruct [:form_help_text, :form_label, :form_placeholder, :max_length, :min_length, :textarea]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      form_help_text: {:string, :generic},
      form_label: {:string, :generic},
      form_placeholder: {:string, :generic},
      max_length: :integer,
      min_length: :integer,
      textarea: :boolean
    ]
  end
end

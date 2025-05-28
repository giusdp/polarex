defmodule Polarex.CustomFieldDateProperties do
  @moduledoc """
  Provides struct and type for a CustomFieldDateProperties
  """

  @type t :: %__MODULE__{
          form_help_text: String.t() | nil,
          form_label: String.t() | nil,
          form_placeholder: String.t() | nil,
          ge: integer | nil,
          le: integer | nil
        }

  defstruct [:form_help_text, :form_label, :form_placeholder, :ge, :le]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      form_help_text: {:string, :generic},
      form_label: {:string, :generic},
      form_placeholder: {:string, :generic},
      ge: :integer,
      le: :integer
    ]
  end
end

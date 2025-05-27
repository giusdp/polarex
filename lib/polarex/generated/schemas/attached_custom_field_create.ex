defmodule Polarex.Generated.AttachedCustomFieldCreate do
  @moduledoc """
  Provides struct and type for a AttachedCustomFieldCreate
  """

  @type t :: %__MODULE__{custom_field_id: String.t(), required: boolean}

  defstruct [:custom_field_id, :required]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [custom_field_id: {:string, :generic}, required: :boolean]
  end
end

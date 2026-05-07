defmodule Polarex.EventTypeUpdate do
  @moduledoc """
  Provides struct and type for a EventTypeUpdate
  """

  @type t :: %__MODULE__{label: String.t(), label_property_selector: String.t() | nil}

  defstruct [:label, :label_property_selector]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: :string, label_property_selector: {:union, [:string, :null]}]
  end
end

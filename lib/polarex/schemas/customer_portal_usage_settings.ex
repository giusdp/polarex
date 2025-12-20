defmodule Polarex.CustomerPortalUsageSettings do
  @moduledoc """
  Provides struct and type for a CustomerPortalUsageSettings
  """

  @type t :: %__MODULE__{show: boolean}

  defstruct [:show]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [show: :boolean]
  end
end

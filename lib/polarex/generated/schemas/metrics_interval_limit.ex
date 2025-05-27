defmodule Polarex.Generated.MetricsIntervalLimit do
  @moduledoc """
  Provides struct and type for a MetricsIntervalLimit
  """

  @type t :: %__MODULE__{max_days: integer}

  defstruct [:max_days]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_days: :integer]
  end
end

defmodule Polarex.ValidationError do
  @moduledoc """
  Provides struct and type for a ValidationError
  """

  @type t :: %__MODULE__{loc: [integer | String.t()], msg: String.t(), type: String.t()}

  defstruct [:loc, :msg, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      loc: [union: [:integer, string: :generic]],
      msg: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end

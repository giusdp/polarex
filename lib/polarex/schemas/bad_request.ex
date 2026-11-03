defmodule Polarex.BadRequest do
  @moduledoc """
  Provides struct and type for a BadRequest
  """

  @type t :: %__MODULE__{detail: String.t(), error: String.t()}

  defstruct [:detail, :error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [detail: :string, error: {:const, "BadRequest"}]
  end
end

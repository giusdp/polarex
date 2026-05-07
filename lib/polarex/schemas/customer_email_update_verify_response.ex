defmodule Polarex.CustomerEmailUpdateVerifyResponse do
  @moduledoc """
  Provides struct and type for a CustomerEmailUpdateVerifyResponse
  """

  @type t :: %__MODULE__{token: String.t()}

  defstruct [:token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [token: :string]
  end
end

defmodule Polarex.CustomerEmailUpdateRequest do
  @moduledoc """
  Provides struct and type for a CustomerEmailUpdateRequest
  """

  @type t :: %__MODULE__{email: String.t()}

  defstruct [:email]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, "email"}]
  end
end

defmodule Polarex.UserInfoOrganization do
  @moduledoc """
  Provides struct and type for a UserInfoOrganization
  """

  @type t :: %__MODULE__{name: String.t() | nil, sub: String.t()}

  defstruct [:name, :sub]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:union, [{:string, :generic}, :null]}, sub: {:string, :generic}]
  end
end

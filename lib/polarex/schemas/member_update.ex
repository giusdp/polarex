defmodule Polarex.MemberUpdate do
  @moduledoc """
  Provides struct and type for a MemberUpdate
  """

  @type t :: %__MODULE__{email: String.t() | nil, name: String.t() | nil, role: String.t() | nil}

  defstruct [:email, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [{:string, "email"}, :null]},
      name: {:union, [:string, :null]},
      role: {:union, [{:enum, ["owner", "billing_manager", "member"]}, :null]}
    ]
  end
end

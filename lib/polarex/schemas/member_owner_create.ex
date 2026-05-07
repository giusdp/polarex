defmodule Polarex.MemberOwnerCreate do
  @moduledoc """
  Provides struct and type for a MemberOwnerCreate
  """

  @type t :: %__MODULE__{email: String.t(), external_id: String.t() | nil, name: String.t() | nil}

  defstruct [:email, :external_id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, "email"},
      external_id: {:union, [:string, :null]},
      name: {:union, [:string, :null]}
    ]
  end
end

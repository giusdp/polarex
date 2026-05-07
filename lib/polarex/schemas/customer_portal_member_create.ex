defmodule Polarex.CustomerPortalMemberCreate do
  @moduledoc """
  Provides struct and type for a CustomerPortalMemberCreate
  """

  @type t :: %__MODULE__{email: String.t(), name: String.t() | nil, role: String.t() | nil}

  defstruct [:email, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, "email"},
      name: {:union, [:string, :null]},
      role: {:enum, ["owner", "billing_manager", "member"]}
    ]
  end
end

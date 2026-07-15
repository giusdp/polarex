defmodule Polarex.CustomerPortalMemberUpdate do
  @moduledoc """
  Provides struct and type for a CustomerPortalMemberUpdate
  """

  @type t :: %__MODULE__{name: String.t() | nil, role: String.t() | nil}

  defstruct [:name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:union, [:string, :null]},
      role: {:union, [{:enum, ["owner", "billing_manager", "member"]}, :null]}
    ]
  end
end

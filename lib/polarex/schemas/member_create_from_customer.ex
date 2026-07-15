defmodule Polarex.MemberCreateFromCustomer do
  @moduledoc """
  Provides struct and type for a MemberCreateFromCustomer
  """

  @type t :: %__MODULE__{
          email: String.t(),
          external_id: String.t() | nil,
          name: String.t() | nil,
          role: String.t() | nil
        }

  defstruct [:email, :external_id, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, "email"},
      external_id: {:union, [:string, :null]},
      name: {:union, [:string, :null]},
      role: {:enum, ["member", "billing_manager"]}
    ]
  end
end

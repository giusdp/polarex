defmodule Polarex.MemberCreate do
  @moduledoc """
  Provides struct and type for a MemberCreate
  """

  @type t :: %__MODULE__{
          customer_id: String.t(),
          email: String.t(),
          external_id: String.t() | nil,
          name: String.t() | nil,
          role: String.t() | nil
        }

  defstruct [:customer_id, :email, :external_id, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer_id: {:string, "uuid4"},
      email: {:string, "email"},
      external_id: {:union, [:string, :null]},
      name: {:union, [:string, :null]},
      role: {:enum, ["member", "billing_manager"]}
    ]
  end
end

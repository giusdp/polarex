defmodule Polarex.PortalAuthenticatedUser do
  @moduledoc """
  Provides struct and type for a PortalAuthenticatedUser
  """

  @type t :: %__MODULE__{
          customer_id: String.t(),
          email: String.t(),
          member_id: String.t() | nil,
          name: String.t() | nil,
          role: String.t() | nil,
          type: String.t()
        }

  defstruct [:customer_id, :email, :member_id, :name, :role, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer_id: {:string, "uuid4"},
      email: :string,
      member_id: {:union, [{:string, "uuid4"}, :null]},
      name: {:union, [:string, :null]},
      role: {:union, [:string, :null]},
      type: :string
    ]
  end
end

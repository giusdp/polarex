defmodule Polarex.CustomerPortalMember do
  @moduledoc """
  Provides struct and type for a CustomerPortalMember
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          email: String.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          role: String.t()
        }

  defstruct [:created_at, :email, :id, :modified_at, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      email: :string,
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: {:union, [:string, :null]},
      role: {:enum, ["owner", "billing_manager", "member"]}
    ]
  end
end

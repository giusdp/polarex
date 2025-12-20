defmodule Polarex.Member do
  @moduledoc """
  Provides struct and type for a Member
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          customer_id: String.t(),
          email: String.t(),
          external_id: String.t() | nil,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          role: String.t()
        }

  defstruct [:created_at, :customer_id, :email, :external_id, :id, :modified_at, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      customer_id: {:string, :generic},
      email: {:string, :generic},
      external_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:union, [{:string, :generic}, :null]},
      role: {:enum, ["owner", "billing_manager", "member"]}
    ]
  end
end

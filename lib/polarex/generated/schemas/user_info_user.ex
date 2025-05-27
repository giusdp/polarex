defmodule Polarex.Generated.UserInfoUser do
  @moduledoc """
  Provides struct and type for a UserInfoUser
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          email_verified: boolean | nil,
          name: String.t() | nil,
          sub: String.t()
        }

  defstruct [:email, :email_verified, :name, :sub]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [{:string, :generic}, :null]},
      email_verified: {:union, [:boolean, :null]},
      name: {:union, [{:string, :generic}, :null]},
      sub: {:string, :generic}
    ]
  end
end

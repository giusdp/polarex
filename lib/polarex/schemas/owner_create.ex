defmodule Polarex.OwnerCreate do
  @moduledoc """
  Provides struct and type for a OwnerCreate
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          external_id: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:email, :external_id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [{:string, :email}, :null]},
      external_id: {:union, [{:string, :generic}, :null]},
      name: {:union, [{:string, :generic}, :null]}
    ]
  end
end

defmodule Polarex.LicenseKeyMember do
  @moduledoc """
  Provides struct and type for a LicenseKeyMember
  """

  @type t :: %__MODULE__{email: String.t(), external_id: String.t() | nil, id: String.t()}

  defstruct [:email, :external_id, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: :string, external_id: {:union, [:string, :null]}, id: {:string, "uuid4"}]
  end
end

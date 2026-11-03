defmodule Polarex.CustomerBenefitGrantMember do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantMember
  """

  @type t :: %__MODULE__{id: String.t(), oauth_accounts: map}

  defstruct [:id, :oauth_accounts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, "uuid4"}, oauth_accounts: :map]
  end
end

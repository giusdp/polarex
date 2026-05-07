defmodule Polarex.CustomerPortalMemberUpdate do
  @moduledoc """
  Provides struct and type for a CustomerPortalMemberUpdate
  """

  @type t :: %__MODULE__{role: String.t() | nil}

  defstruct [:role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [role: {:union, [{:enum, ["owner", "billing_manager", "member"]}, :null]}]
  end
end

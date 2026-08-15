defmodule Polarex.OrganizationDisputeSettings do
  @moduledoc """
  Provides struct and type for a OrganizationDisputeSettings
  """

  @type t :: %__MODULE__{auto_accept_below_amount: integer | nil}

  defstruct [:auto_accept_below_amount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [auto_accept_below_amount: {:union, [:integer, :null]}]
  end
end

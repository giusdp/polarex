defmodule Polarex.CustomerPortalSubscriptionSettings do
  @moduledoc """
  Provides struct and type for a CustomerPortalSubscriptionSettings
  """

  @type t :: %__MODULE__{update_plan: boolean, update_seats: boolean}

  defstruct [:update_plan, :update_seats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [update_plan: :boolean, update_seats: :boolean]
  end
end

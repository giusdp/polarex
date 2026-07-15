defmodule Polarex.CustomerPortalSubscriptionSettings do
  @moduledoc """
  Provides struct and type for a CustomerPortalSubscriptionSettings
  """

  @type t :: %__MODULE__{pause: boolean | nil, update_plan: boolean, update_seats: boolean}

  defstruct [:pause, :update_plan, :update_seats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pause: :boolean, update_plan: :boolean, update_seats: :boolean]
  end
end

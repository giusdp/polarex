defmodule Polarex.OrganizationNotificationSettings do
  @moduledoc """
  Provides struct and type for a OrganizationNotificationSettings
  """

  @type t :: %__MODULE__{new_order: boolean, new_subscription: boolean}

  defstruct [:new_order, :new_subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [new_order: :boolean, new_subscription: :boolean]
  end
end

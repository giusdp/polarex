defmodule Polarex.SubscriptionUpdateClear do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateClear
  """

  @type t :: %__MODULE__{pending_update: nil}

  defstruct [:pending_update]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pending_update: :null]
  end
end

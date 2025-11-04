defmodule Polarex.SubscriptionUpdateTrial do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateTrial
  """

  @type t :: %__MODULE__{trial_end: DateTime.t() | String.t()}

  defstruct [:trial_end]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [trial_end: {:union, const: "now", string: :date_time}]
  end
end

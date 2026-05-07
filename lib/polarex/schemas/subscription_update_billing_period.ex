defmodule Polarex.SubscriptionUpdateBillingPeriod do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateBillingPeriod
  """

  @type t :: %__MODULE__{current_billing_period_end: DateTime.t()}

  defstruct [:current_billing_period_end]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [current_billing_period_end: {:string, "date-time"}]
  end
end

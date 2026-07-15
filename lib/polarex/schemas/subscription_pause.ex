defmodule Polarex.SubscriptionPause do
  @moduledoc """
  Provides struct and type for a SubscriptionPause
  """

  @type t :: %__MODULE__{pause_at_period_end: boolean, resumes_at: DateTime.t() | nil}

  defstruct [:pause_at_period_end, :resumes_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pause_at_period_end: :boolean, resumes_at: {:union, [{:string, "date-time"}, :null]}]
  end
end

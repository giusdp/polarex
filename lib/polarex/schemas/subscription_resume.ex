defmodule Polarex.SubscriptionResume do
  @moduledoc """
  Provides struct and type for a SubscriptionResume
  """

  @type t :: %__MODULE__{resume: true}

  defstruct [:resume]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [resume: {:const, true}]
  end
end

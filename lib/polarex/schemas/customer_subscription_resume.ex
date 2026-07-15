defmodule Polarex.CustomerSubscriptionResume do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionResume
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

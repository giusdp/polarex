defmodule Polarex.CustomerPaymentMethodConfirm do
  @moduledoc """
  Provides struct and type for a CustomerPaymentMethodConfirm
  """

  @type t :: %__MODULE__{set_default: boolean, setup_intent_id: String.t()}

  defstruct [:set_default, :setup_intent_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [set_default: :boolean, setup_intent_id: :string]
  end
end

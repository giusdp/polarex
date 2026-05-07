defmodule Polarex.CustomerPaymentMethodCreateRequiresActionResponse do
  @moduledoc """
  Provides struct and type for a CustomerPaymentMethodCreateRequiresActionResponse
  """

  @type t :: %__MODULE__{client_secret: String.t(), status: String.t()}

  defstruct [:client_secret, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [client_secret: :string, status: {:const, "requires_action"}]
  end
end

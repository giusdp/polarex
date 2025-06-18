defmodule Polarex.CustomerSessionCustomerExternalIDCreate do
  @moduledoc """
  Provides struct and type for a CustomerSessionCustomerExternalIDCreate
  """

  @type t :: %__MODULE__{external_customer_id: String.t()}

  defstruct [:external_customer_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [external_customer_id: {:string, :generic}]
  end
end

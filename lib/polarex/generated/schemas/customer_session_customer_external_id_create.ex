defmodule Polarex.Generated.CustomerSessionCustomerExternalIDCreate do
  @moduledoc """
  Provides struct and type for a CustomerSessionCustomerExternalIDCreate
  """

  @type t :: %__MODULE__{customer_external_id: String.t()}

  defstruct [:customer_external_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_external_id: {:string, :generic}]
  end
end

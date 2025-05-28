defmodule Polarex.CustomerSessionCustomerIDCreate do
  @moduledoc """
  Provides struct and type for a CustomerSessionCustomerIDCreate
  """

  @type t :: %__MODULE__{customer_id: String.t()}

  defstruct [:customer_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_id: {:string, :generic}]
  end
end

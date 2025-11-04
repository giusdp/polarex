defmodule Polarex.CustomerSessionCustomerIDCreate do
  @moduledoc """
  Provides struct and type for a CustomerSessionCustomerIDCreate
  """

  @type t :: %__MODULE__{customer_id: String.t(), return_url: String.t() | nil}

  defstruct [:customer_id, :return_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_id: {:string, :generic}, return_url: {:union, [{:string, :uri}, :null]}]
  end
end

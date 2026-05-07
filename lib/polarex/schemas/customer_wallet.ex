defmodule Polarex.CustomerWallet do
  @moduledoc """
  Provides struct and type for a CustomerWallet
  """

  @type t :: %__MODULE__{
          balance: integer,
          created_at: DateTime.t(),
          currency: String.t(),
          customer_id: String.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil
        }

  defstruct [:balance, :created_at, :currency, :customer_id, :id, :modified_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      balance: :integer,
      created_at: {:string, "date-time"},
      currency: :string,
      customer_id: {:string, "uuid4"},
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]}
    ]
  end
end

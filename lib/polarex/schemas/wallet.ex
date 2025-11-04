defmodule Polarex.Wallet do
  @moduledoc """
  Provides struct and type for a Wallet
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
      created_at: {:string, :date_time},
      currency: {:string, :generic},
      customer_id: {:string, :generic},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end

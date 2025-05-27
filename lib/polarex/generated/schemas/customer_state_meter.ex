defmodule Polarex.Generated.CustomerStateMeter do
  @moduledoc """
  Provides struct and type for a CustomerStateMeter
  """

  @type t :: %__MODULE__{
          balance: number,
          consumed_units: number,
          created_at: DateTime.t(),
          credited_units: integer,
          meter_id: String.t(),
          modified_at: DateTime.t() | nil
        }

  defstruct [:balance, :consumed_units, :created_at, :credited_units, :meter_id, :modified_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      balance: :number,
      consumed_units: :number,
      created_at: {:string, :date_time},
      credited_units: :integer,
      meter_id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end

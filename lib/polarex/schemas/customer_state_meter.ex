defmodule Polarex.CustomerStateMeter do
  @moduledoc """
  Provides struct and type for a CustomerStateMeter
  """

  @type t :: %__MODULE__{
          balance: number,
          consumed_units: number,
          created_at: DateTime.t(),
          credited_units: integer,
          id: String.t(),
          meter_id: String.t(),
          modified_at: DateTime.t() | nil
        }

  defstruct [
    :balance,
    :consumed_units,
    :created_at,
    :credited_units,
    :id,
    :meter_id,
    :modified_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      balance: :number,
      consumed_units: :number,
      created_at: {:string, :date_time},
      credited_units: :integer,
      id: {:string, :generic},
      meter_id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end

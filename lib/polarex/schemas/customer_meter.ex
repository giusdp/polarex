defmodule Polarex.CustomerMeter do
  @moduledoc """
  Provides struct and type for a CustomerMeter
  """

  @type t :: %__MODULE__{
          balance: number,
          consumed_units: number,
          created_at: DateTime.t(),
          credited_units: integer,
          customer: Polarex.Customer.t(),
          customer_id: String.t(),
          id: String.t(),
          meter: Polarex.Meter.t(),
          meter_id: String.t(),
          modified_at: DateTime.t() | nil
        }

  defstruct [
    :balance,
    :consumed_units,
    :created_at,
    :credited_units,
    :customer,
    :customer_id,
    :id,
    :meter,
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
      customer: {Polarex.Customer, :t},
      customer_id: {:string, :generic},
      id: {:string, :generic},
      meter: {Polarex.Meter, :t},
      meter_id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end

defmodule Polarex.Generated.CustomerSubscriptionMeterMeter do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionMeterMeter
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t()
        }

  defstruct [:created_at, :id, :modified_at, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic}
    ]
  end
end

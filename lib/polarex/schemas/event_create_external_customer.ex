defmodule Polarex.EventCreateExternalCustomer do
  @moduledoc """
  Provides struct and type for a EventCreateExternalCustomer
  """

  @type t :: %__MODULE__{
          external_customer_id: String.t(),
          metadata: Polarex.Metadata.t() | nil,
          name: String.t(),
          organization_id: String.t() | nil,
          timestamp: DateTime.t() | nil
        }

  defstruct [:external_customer_id, :metadata, :name, :organization_id, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: {:string, :generic},
      metadata: {Polarex.Metadata, :t},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      timestamp: {:string, :date_time}
    ]
  end
end

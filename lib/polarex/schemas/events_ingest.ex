defmodule Polarex.EventsIngest do
  @moduledoc """
  Provides struct and type for a EventsIngest
  """

  @type t :: %__MODULE__{
          events: [Polarex.EventCreateCustomer.t() | Polarex.EventCreateExternalCustomer.t()]
        }

  defstruct [:events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      events: [
        union: [{Polarex.EventCreateCustomer, :t}, {Polarex.EventCreateExternalCustomer, :t}]
      ]
    ]
  end
end

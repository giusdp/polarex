defmodule Polarex.Generated.EventsIngest do
  @moduledoc """
  Provides struct and type for a EventsIngest
  """

  @type t :: %__MODULE__{
          events: [
            Polarex.Generated.EventCreateCustomer.t()
            | Polarex.Generated.EventCreateExternalCustomer.t()
          ]
        }

  defstruct [:events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      events: [
        union: [
          {Polarex.Generated.EventCreateCustomer, :t},
          {Polarex.Generated.EventCreateExternalCustomer, :t}
        ]
      ]
    ]
  end
end

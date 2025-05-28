defmodule Polarex.PaymentMethodGeneric do
  @moduledoc """
  Provides struct and type for a PaymentMethodGeneric
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          default: boolean,
          id: String.t(),
          type: String.t()
        }

  defstruct [:created_at, :default, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      default: :boolean,
      id: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end

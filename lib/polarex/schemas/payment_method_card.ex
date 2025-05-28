defmodule Polarex.PaymentMethodCard do
  @moduledoc """
  Provides struct and type for a PaymentMethodCard
  """

  @type t :: %__MODULE__{
          card: Polarex.PaymentMethodCardData.t(),
          created_at: DateTime.t(),
          default: boolean,
          id: String.t(),
          type: String.t()
        }

  defstruct [:card, :created_at, :default, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      card: {Polarex.PaymentMethodCardData, :t},
      created_at: {:string, :date_time},
      default: :boolean,
      id: {:string, :generic},
      type: {:const, "card"}
    ]
  end
end

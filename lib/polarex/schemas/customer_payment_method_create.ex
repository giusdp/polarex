defmodule Polarex.CustomerPaymentMethodCreate do
  @moduledoc """
  Provides struct and type for a CustomerPaymentMethodCreate
  """

  @type t :: %__MODULE__{
          confirmation_token_id: String.t(),
          return_url: String.t(),
          set_default: boolean
        }

  defstruct [:confirmation_token_id, :return_url, :set_default]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      confirmation_token_id: {:string, :generic},
      return_url: {:string, :generic},
      set_default: :boolean
    ]
  end
end

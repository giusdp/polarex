defmodule Polarex.CustomerPaymentMethodGeneric do
  @moduledoc """
  Provides struct and type for a CustomerPaymentMethodGeneric
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          customer_id: String.t(),
          id: String.t(),
          is_default: boolean,
          modified_at: DateTime.t() | nil,
          processor: String.t(),
          type: String.t()
        }

  defstruct [:created_at, :customer_id, :id, :is_default, :modified_at, :processor, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      customer_id: {:string, "uuid4"},
      id: {:string, "uuid4"},
      is_default: :boolean,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      processor: {:const, "stripe"},
      type: :string
    ]
  end
end

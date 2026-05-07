defmodule Polarex.PaymentMethodGeneric do
  @moduledoc """
  Provides struct and type for a PaymentMethodGeneric
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          customer_id: String.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          processor: String.t(),
          type: String.t()
        }

  defstruct [:created_at, :customer_id, :id, :modified_at, :processor, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      customer_id: {:string, "uuid4"},
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      processor: {:const, "stripe"},
      type: :string
    ]
  end
end

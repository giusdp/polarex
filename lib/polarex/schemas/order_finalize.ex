defmodule Polarex.OrderFinalize do
  @moduledoc """
  Provides struct and type for a OrderFinalize
  """

  @type t :: %__MODULE__{payment_method_id: String.t() | nil}

  defstruct [:payment_method_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_method_id: {:union, [{:string, "uuid4"}, :null]}]
  end
end

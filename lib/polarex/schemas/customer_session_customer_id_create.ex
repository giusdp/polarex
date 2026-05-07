defmodule Polarex.CustomerSessionCustomerIDCreate do
  @moduledoc """
  Provides struct and type for a CustomerSessionCustomerIDCreate
  """

  @type t :: %__MODULE__{
          customer_id: String.t(),
          external_member_id: String.t() | nil,
          member_id: String.t() | nil,
          return_url: String.t() | nil
        }

  defstruct [:customer_id, :external_member_id, :member_id, :return_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer_id: {:string, "uuid4"},
      external_member_id: {:union, [:string, :null]},
      member_id: {:union, [{:string, "uuid4"}, :null]},
      return_url: {:union, [{:string, "uri"}, :null]}
    ]
  end
end

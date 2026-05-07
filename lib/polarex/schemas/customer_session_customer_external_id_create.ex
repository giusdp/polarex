defmodule Polarex.CustomerSessionCustomerExternalIDCreate do
  @moduledoc """
  Provides struct and type for a CustomerSessionCustomerExternalIDCreate
  """

  @type t :: %__MODULE__{
          external_customer_id: String.t(),
          external_member_id: String.t() | nil,
          member_id: String.t() | nil,
          return_url: String.t() | nil
        }

  defstruct [:external_customer_id, :external_member_id, :member_id, :return_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: :string,
      external_member_id: {:union, [:string, :null]},
      member_id: {:union, [{:string, "uuid4"}, :null]},
      return_url: {:union, [{:string, "uri"}, :null]}
    ]
  end
end

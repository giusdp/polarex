defmodule Polarex.Generated.CustomerSession do
  @moduledoc """
  Provides struct and type for a CustomerSession
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          customer: Polarex.Generated.Customer.t(),
          customer_id: String.t(),
          customer_portal_url: String.t(),
          expires_at: DateTime.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          token: String.t()
        }

  defstruct [
    :created_at,
    :customer,
    :customer_id,
    :customer_portal_url,
    :expires_at,
    :id,
    :modified_at,
    :token
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      customer: {Polarex.Generated.Customer, :t},
      customer_id: {:string, :generic},
      customer_portal_url: {:string, :generic},
      expires_at: {:string, :date_time},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      token: {:string, :generic}
    ]
  end
end

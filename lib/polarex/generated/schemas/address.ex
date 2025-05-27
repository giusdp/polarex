defmodule Polarex.Generated.Address do
  @moduledoc """
  Provides struct and type for a Address
  """

  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t(),
          line1: String.t() | nil,
          line2: String.t() | nil,
          postal_code: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:city, :country, :line1, :line2, :postal_code, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: {:union, [{:string, :generic}, :null]},
      country: {:string, :generic},
      line1: {:union, [{:string, :generic}, :null]},
      line2: {:union, [{:string, :generic}, :null]},
      postal_code: {:union, [{:string, :generic}, :null]},
      state: {:union, [{:string, :generic}, :null]}
    ]
  end
end

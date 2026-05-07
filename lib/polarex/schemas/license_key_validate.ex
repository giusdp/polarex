defmodule Polarex.LicenseKeyValidate do
  @moduledoc """
  Provides struct and type for a LicenseKeyValidate
  """

  @type t :: %__MODULE__{
          activation_id: String.t() | nil,
          benefit_id: String.t() | nil,
          conditions: map | nil,
          customer_id: String.t() | nil,
          increment_usage: integer | nil,
          key: String.t(),
          organization_id: String.t()
        }

  defstruct [
    :activation_id,
    :benefit_id,
    :conditions,
    :customer_id,
    :increment_usage,
    :key,
    :organization_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activation_id: {:union, [{:string, "uuid4"}, :null]},
      benefit_id: {:union, [{:string, "uuid4"}, :null]},
      conditions: :map,
      customer_id: {:union, [{:string, "uuid4"}, :null]},
      increment_usage: {:union, [:integer, :null]},
      key: :string,
      organization_id: {:string, "uuid4"}
    ]
  end
end

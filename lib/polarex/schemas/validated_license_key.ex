defmodule Polarex.ValidatedLicenseKey do
  @moduledoc """
  Provides struct and type for a ValidatedLicenseKey
  """

  @type t :: %__MODULE__{
          activation: Polarex.LicenseKeyActivationBase.t() | nil,
          benefit_id: String.t(),
          created_at: DateTime.t(),
          customer: Polarex.LicenseKeyCustomer.t(),
          customer_id: String.t(),
          display_key: String.t(),
          expires_at: DateTime.t() | nil,
          id: String.t(),
          key: String.t(),
          last_validated_at: DateTime.t() | nil,
          limit_activations: integer | nil,
          limit_usage: integer | nil,
          modified_at: DateTime.t() | nil,
          organization_id: String.t(),
          status: String.t(),
          usage: integer,
          validations: integer
        }

  defstruct [
    :activation,
    :benefit_id,
    :created_at,
    :customer,
    :customer_id,
    :display_key,
    :expires_at,
    :id,
    :key,
    :last_validated_at,
    :limit_activations,
    :limit_usage,
    :modified_at,
    :organization_id,
    :status,
    :usage,
    :validations
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activation: {:union, [{Polarex.LicenseKeyActivationBase, :t}, :null]},
      benefit_id: {:string, :generic},
      created_at: {:string, :date_time},
      customer: {Polarex.LicenseKeyCustomer, :t},
      customer_id: {:string, :generic},
      display_key: {:string, :generic},
      expires_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      key: {:string, :generic},
      last_validated_at: {:union, [{:string, :date_time}, :null]},
      limit_activations: {:union, [:integer, :null]},
      limit_usage: {:union, [:integer, :null]},
      modified_at: {:union, [{:string, :date_time}, :null]},
      organization_id: {:string, :generic},
      status: {:enum, ["granted", "revoked", "disabled"]},
      usage: :integer,
      validations: :integer
    ]
  end
end

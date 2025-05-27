defmodule Polarex.Generated.CustomerBenefitGrantMeterCredit do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantMeterCredit
  """

  @type t :: %__MODULE__{
          benefit: Polarex.Generated.BenefitMeterCreditSubscriber.t(),
          benefit_id: String.t(),
          created_at: DateTime.t(),
          customer: Polarex.Generated.CustomerPortalCustomer.t(),
          customer_id: String.t(),
          granted_at: DateTime.t() | nil,
          id: String.t(),
          is_granted: boolean,
          is_revoked: boolean,
          modified_at: DateTime.t() | nil,
          order_id: String.t() | nil,
          properties: Polarex.Generated.BenefitGrantMeterCreditProperties.t(),
          revoked_at: DateTime.t() | nil,
          subscription_id: String.t() | nil
        }

  defstruct [
    :benefit,
    :benefit_id,
    :created_at,
    :customer,
    :customer_id,
    :granted_at,
    :id,
    :is_granted,
    :is_revoked,
    :modified_at,
    :order_id,
    :properties,
    :revoked_at,
    :subscription_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefit: {Polarex.Generated.BenefitMeterCreditSubscriber, :t},
      benefit_id: {:string, :generic},
      created_at: {:string, :date_time},
      customer: {Polarex.Generated.CustomerPortalCustomer, :t},
      customer_id: {:string, :generic},
      granted_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      is_granted: :boolean,
      is_revoked: :boolean,
      modified_at: {:union, [{:string, :date_time}, :null]},
      order_id: {:union, [{:string, :generic}, :null]},
      properties: {Polarex.Generated.BenefitGrantMeterCreditProperties, :t},
      revoked_at: {:union, [{:string, :date_time}, :null]},
      subscription_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

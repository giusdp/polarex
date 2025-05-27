defmodule Polarex.Generated.BenefitGrant do
  @moduledoc """
  Provides struct and type for a BenefitGrant
  """

  @type t :: %__MODULE__{
          benefit_id: String.t(),
          created_at: DateTime.t(),
          customer: Polarex.Generated.Customer.t(),
          customer_id: String.t(),
          error: Polarex.Generated.BenefitGrantError.t() | nil,
          granted_at: DateTime.t() | nil,
          id: String.t(),
          is_granted: boolean,
          is_revoked: boolean,
          modified_at: DateTime.t() | nil,
          order_id: String.t() | nil,
          properties:
            map
            | Polarex.Generated.BenefitGrantDiscordProperties.t()
            | Polarex.Generated.BenefitGrantDownloadablesProperties.t()
            | Polarex.Generated.BenefitGrantGitHubRepositoryProperties.t()
            | Polarex.Generated.BenefitGrantLicenseKeysProperties.t(),
          revoked_at: DateTime.t() | nil,
          subscription_id: String.t() | nil
        }

  defstruct [
    :benefit_id,
    :created_at,
    :customer,
    :customer_id,
    :error,
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
      benefit_id: {:string, :generic},
      created_at: {:string, :date_time},
      customer: {Polarex.Generated.Customer, :t},
      customer_id: {:string, :generic},
      error: {:union, [{Polarex.Generated.BenefitGrantError, :t}, :null]},
      granted_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      is_granted: :boolean,
      is_revoked: :boolean,
      modified_at: {:union, [{:string, :date_time}, :null]},
      order_id: {:union, [{:string, :generic}, :null]},
      properties:
        {:union,
         [
           :map,
           {Polarex.Generated.BenefitGrantDiscordProperties, :t},
           {Polarex.Generated.BenefitGrantDownloadablesProperties, :t},
           {Polarex.Generated.BenefitGrantGitHubRepositoryProperties, :t},
           {Polarex.Generated.BenefitGrantLicenseKeysProperties, :t}
         ]},
      revoked_at: {:union, [{:string, :date_time}, :null]},
      subscription_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end

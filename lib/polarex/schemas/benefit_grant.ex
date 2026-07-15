defmodule Polarex.BenefitGrant do
  @moduledoc """
  Provides struct and type for a BenefitGrant
  """

  @type t :: %__MODULE__{
          benefit:
            Polarex.BenefitCustom.t()
            | Polarex.BenefitDiscord.t()
            | Polarex.BenefitDownloadables.t()
            | Polarex.BenefitFeatureFlag.t()
            | Polarex.BenefitGitHubRepository.t()
            | Polarex.BenefitLicenseKeys.t()
            | Polarex.BenefitMeterCredit.t()
            | Polarex.BenefitSlackSharedChannel.t(),
          benefit_id: String.t(),
          created_at: DateTime.t(),
          customer: Polarex.CustomerIndividual.t() | Polarex.CustomerTeam.t(),
          customer_id: String.t(),
          error: Polarex.BenefitGrantError.t() | nil,
          granted_at: DateTime.t() | nil,
          id: String.t(),
          is_granted: boolean,
          is_revoked: boolean,
          member: Polarex.Member.t() | nil,
          member_id: String.t() | nil,
          modified_at: DateTime.t() | nil,
          order_id: String.t() | nil,
          properties:
            map
            | Polarex.BenefitGrantDiscordProperties.t()
            | Polarex.BenefitGrantDownloadablesProperties.t()
            | Polarex.BenefitGrantGitHubRepositoryProperties.t()
            | Polarex.BenefitGrantLicenseKeysProperties.t()
            | Polarex.BenefitGrantSlackSharedChannelProperties.t(),
          revoked_at: DateTime.t() | nil,
          subscription_id: String.t() | nil
        }

  defstruct [
    :benefit,
    :benefit_id,
    :created_at,
    :customer,
    :customer_id,
    :error,
    :granted_at,
    :id,
    :is_granted,
    :is_revoked,
    :member,
    :member_id,
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
      benefit:
        {:union,
         [
           {Polarex.BenefitCustom, :t},
           {Polarex.BenefitDiscord, :t},
           {Polarex.BenefitDownloadables, :t},
           {Polarex.BenefitFeatureFlag, :t},
           {Polarex.BenefitGitHubRepository, :t},
           {Polarex.BenefitLicenseKeys, :t},
           {Polarex.BenefitMeterCredit, :t},
           {Polarex.BenefitSlackSharedChannel, :t}
         ]},
      benefit_id: {:string, "uuid4"},
      created_at: {:string, "date-time"},
      customer: {:union, [{Polarex.CustomerIndividual, :t}, {Polarex.CustomerTeam, :t}]},
      customer_id: {:string, "uuid4"},
      error: {:union, [{Polarex.BenefitGrantError, :t}, :null]},
      granted_at: {:union, [{:string, "date-time"}, :null]},
      id: {:string, "uuid4"},
      is_granted: :boolean,
      is_revoked: :boolean,
      member: {:union, [{Polarex.Member, :t}, :null]},
      member_id: {:union, [{:string, "uuid4"}, :null]},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      order_id: {:union, [{:string, "uuid4"}, :null]},
      properties:
        {:union,
         [
           :map,
           {Polarex.BenefitGrantDiscordProperties, :t},
           {Polarex.BenefitGrantDownloadablesProperties, :t},
           {Polarex.BenefitGrantGitHubRepositoryProperties, :t},
           {Polarex.BenefitGrantLicenseKeysProperties, :t},
           {Polarex.BenefitGrantSlackSharedChannelProperties, :t}
         ]},
      revoked_at: {:union, [{:string, "date-time"}, :null]},
      subscription_id: {:union, [{:string, "uuid4"}, :null]}
    ]
  end
end

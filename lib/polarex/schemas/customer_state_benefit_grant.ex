defmodule Polarex.CustomerStateBenefitGrant do
  @moduledoc """
  Provides struct and type for a CustomerStateBenefitGrant
  """

  @type t :: %__MODULE__{
          benefit_id: String.t(),
          benefit_type: String.t(),
          created_at: DateTime.t(),
          granted_at: DateTime.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          properties:
            map
            | Polarex.BenefitGrantDiscordProperties.t()
            | Polarex.BenefitGrantDownloadablesProperties.t()
            | Polarex.BenefitGrantGitHubRepositoryProperties.t()
            | Polarex.BenefitGrantLicenseKeysProperties.t()
        }

  defstruct [:benefit_id, :benefit_type, :created_at, :granted_at, :id, :modified_at, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefit_id: {:string, :generic},
      benefit_type:
        {:enum,
         [
           "custom",
           "discord",
           "github_repository",
           "downloadables",
           "license_keys",
           "meter_credit"
         ]},
      created_at: {:string, :date_time},
      granted_at: {:string, :date_time},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      properties:
        {:union,
         [
           :map,
           {Polarex.BenefitGrantDiscordProperties, :t},
           {Polarex.BenefitGrantDownloadablesProperties, :t},
           {Polarex.BenefitGrantGitHubRepositoryProperties, :t},
           {Polarex.BenefitGrantLicenseKeysProperties, :t}
         ]}
    ]
  end
end

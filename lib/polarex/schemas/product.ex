defmodule Polarex.Product do
  @moduledoc """
  Provides struct and type for a Product
  """

  @type t :: %__MODULE__{
          attached_custom_fields: [Polarex.AttachedCustomField.t()],
          benefits: [
            Polarex.BenefitCustom.t()
            | Polarex.BenefitDiscord.t()
            | Polarex.BenefitDownloadables.t()
            | Polarex.BenefitFeatureFlag.t()
            | Polarex.BenefitGitHubRepository.t()
            | Polarex.BenefitLicenseKeys.t()
            | Polarex.BenefitMeterCredit.t()
          ],
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          is_archived: boolean,
          is_recurring: boolean,
          medias: [Polarex.ProductMediaFileRead.t()],
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          prices: [map],
          recurring_interval: String.t() | nil,
          recurring_interval_count: integer | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil,
          visibility: String.t()
        }

  defstruct [
    :attached_custom_fields,
    :benefits,
    :created_at,
    :description,
    :id,
    :is_archived,
    :is_recurring,
    :medias,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :prices,
    :recurring_interval,
    :recurring_interval_count,
    :trial_interval,
    :trial_interval_count,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attached_custom_fields: [{Polarex.AttachedCustomField, :t}],
      benefits: [
        union: [
          {Polarex.BenefitCustom, :t},
          {Polarex.BenefitDiscord, :t},
          {Polarex.BenefitDownloadables, :t},
          {Polarex.BenefitFeatureFlag, :t},
          {Polarex.BenefitGitHubRepository, :t},
          {Polarex.BenefitLicenseKeys, :t},
          {Polarex.BenefitMeterCredit, :t}
        ]
      ],
      created_at: {:string, "date-time"},
      description: {:union, [:string, :null]},
      id: {:string, "uuid4"},
      is_archived: :boolean,
      is_recurring: :boolean,
      medias: [{Polarex.ProductMediaFileRead, :t}],
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"},
      prices: [:map],
      recurring_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      recurring_interval_count: {:union, [:integer, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      visibility: {:enum, ["draft", "private", "public"]}
    ]
  end
end

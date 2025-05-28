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
          metadata: Polarex.Metadata.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          prices: [map],
          recurring_interval: String.t() | nil
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
    :recurring_interval
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
          {Polarex.BenefitGitHubRepository, :t},
          {Polarex.BenefitLicenseKeys, :t},
          {Polarex.BenefitMeterCredit, :t}
        ]
      ],
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      is_archived: :boolean,
      is_recurring: :boolean,
      medias: [{Polarex.ProductMediaFileRead, :t}],
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      prices: [:map],
      recurring_interval: {:union, [{:enum, ["month", "year"]}, :null]}
    ]
  end
end

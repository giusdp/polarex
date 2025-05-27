defmodule Polarex.Generated.ListResourceBenefit do
  @moduledoc """
  Provides struct and type for a ListResourceBenefit
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.Generated.BenefitCustom.t()
            | Polarex.Generated.BenefitDiscord.t()
            | Polarex.Generated.BenefitDownloadables.t()
            | Polarex.Generated.BenefitGitHubRepository.t()
            | Polarex.Generated.BenefitLicenseKeys.t()
            | Polarex.Generated.BenefitMeterCredit.t()
          ],
          pagination: Polarex.Generated.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.Generated.BenefitCustom, :t},
          {Polarex.Generated.BenefitDiscord, :t},
          {Polarex.Generated.BenefitDownloadables, :t},
          {Polarex.Generated.BenefitGitHubRepository, :t},
          {Polarex.Generated.BenefitLicenseKeys, :t},
          {Polarex.Generated.BenefitMeterCredit, :t}
        ]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

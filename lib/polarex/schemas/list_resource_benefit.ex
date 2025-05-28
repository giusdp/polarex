defmodule Polarex.ListResourceBenefit do
  @moduledoc """
  Provides struct and type for a ListResourceBenefit
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.BenefitCustom.t()
            | Polarex.BenefitDiscord.t()
            | Polarex.BenefitDownloadables.t()
            | Polarex.BenefitGitHubRepository.t()
            | Polarex.BenefitLicenseKeys.t()
            | Polarex.BenefitMeterCredit.t()
          ],
          pagination: Polarex.Pagination.t()
        }

  defstruct [:items, :pagination]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items: [
        union: [
          {Polarex.BenefitCustom, :t},
          {Polarex.BenefitDiscord, :t},
          {Polarex.BenefitDownloadables, :t},
          {Polarex.BenefitGitHubRepository, :t},
          {Polarex.BenefitLicenseKeys, :t},
          {Polarex.BenefitMeterCredit, :t}
        ]
      ],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

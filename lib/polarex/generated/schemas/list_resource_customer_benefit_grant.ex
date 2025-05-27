defmodule Polarex.Generated.ListResourceCustomerBenefitGrant do
  @moduledoc """
  Provides struct and type for a ListResourceCustomerBenefitGrant
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.Generated.CustomerBenefitGrantCustom.t()
            | Polarex.Generated.CustomerBenefitGrantDiscord.t()
            | Polarex.Generated.CustomerBenefitGrantDownloadables.t()
            | Polarex.Generated.CustomerBenefitGrantGitHubRepository.t()
            | Polarex.Generated.CustomerBenefitGrantLicenseKeys.t()
            | Polarex.Generated.CustomerBenefitGrantMeterCredit.t()
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
          {Polarex.Generated.CustomerBenefitGrantCustom, :t},
          {Polarex.Generated.CustomerBenefitGrantDiscord, :t},
          {Polarex.Generated.CustomerBenefitGrantDownloadables, :t},
          {Polarex.Generated.CustomerBenefitGrantGitHubRepository, :t},
          {Polarex.Generated.CustomerBenefitGrantLicenseKeys, :t},
          {Polarex.Generated.CustomerBenefitGrantMeterCredit, :t}
        ]
      ],
      pagination: {Polarex.Generated.Pagination, :t}
    ]
  end
end

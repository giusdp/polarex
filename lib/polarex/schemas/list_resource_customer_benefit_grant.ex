defmodule Polarex.ListResourceCustomerBenefitGrant do
  @moduledoc """
  Provides struct and type for a ListResourceCustomerBenefitGrant
  """

  @type t :: %__MODULE__{
          items: [
            Polarex.CustomerBenefitGrantCustom.t()
            | Polarex.CustomerBenefitGrantDiscord.t()
            | Polarex.CustomerBenefitGrantDownloadables.t()
            | Polarex.CustomerBenefitGrantGitHubRepository.t()
            | Polarex.CustomerBenefitGrantLicenseKeys.t()
            | Polarex.CustomerBenefitGrantMeterCredit.t()
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
          {Polarex.CustomerBenefitGrantCustom, :t},
          {Polarex.CustomerBenefitGrantDiscord, :t},
          {Polarex.CustomerBenefitGrantDownloadables, :t},
          {Polarex.CustomerBenefitGrantGitHubRepository, :t},
          {Polarex.CustomerBenefitGrantLicenseKeys, :t},
          {Polarex.CustomerBenefitGrantMeterCredit, :t}
        ]
      ],
      pagination: {Polarex.Pagination, :t}
    ]
  end
end

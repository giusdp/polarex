defmodule Polarex.OrganizationFeatureSettings do
  @moduledoc """
  Provides struct and type for a OrganizationFeatureSettings
  """

  @type t :: %__MODULE__{
          issue_funding_enabled: boolean | nil,
          revops_enabled: boolean | nil,
          seat_based_pricing_enabled: boolean | nil,
          wallets_enabled: boolean | nil
        }

  defstruct [
    :issue_funding_enabled,
    :revops_enabled,
    :seat_based_pricing_enabled,
    :wallets_enabled
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      issue_funding_enabled: :boolean,
      revops_enabled: :boolean,
      seat_based_pricing_enabled: :boolean,
      wallets_enabled: :boolean
    ]
  end
end

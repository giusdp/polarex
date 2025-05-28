defmodule Polarex.OrganizationFeatureSettings do
  @moduledoc """
  Provides struct and type for a OrganizationFeatureSettings
  """

  @type t :: %__MODULE__{
          issue_funding_enabled: boolean | nil,
          usage_based_billing_enabled: boolean | nil
        }

  defstruct [:issue_funding_enabled, :usage_based_billing_enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issue_funding_enabled: :boolean, usage_based_billing_enabled: :boolean]
  end
end

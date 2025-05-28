defmodule Polarex.CustomerBenefitGrantGitHubRepositoryUpdate do
  @moduledoc """
  Provides struct and type for a CustomerBenefitGrantGitHubRepositoryUpdate
  """

  @type t :: %__MODULE__{
          benefit_type: String.t(),
          properties: Polarex.CustomerBenefitGrantGitHubRepositoryPropertiesUpdate.t()
        }

  defstruct [:benefit_type, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefit_type: {:const, "github_repository"},
      properties: {Polarex.CustomerBenefitGrantGitHubRepositoryPropertiesUpdate, :t}
    ]
  end
end

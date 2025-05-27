defmodule Polarex.Generated.BenefitGitHubRepositoryUpdate do
  @moduledoc """
  Provides struct and type for a BenefitGitHubRepositoryUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: Polarex.Generated.Metadata.t() | nil,
          properties: Polarex.Generated.BenefitGitHubRepositoryCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Generated.Metadata, :t},
      properties:
        {:union, [{Polarex.Generated.BenefitGitHubRepositoryCreateProperties, :t}, :null]},
      type: {:const, "github_repository"}
    ]
  end
end

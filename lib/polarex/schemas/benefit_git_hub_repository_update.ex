defmodule Polarex.BenefitGitHubRepositoryUpdate do
  @moduledoc """
  Provides struct and type for a BenefitGitHubRepositoryUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          metadata: Polarex.Metadata.t() | nil,
          properties: Polarex.BenefitGitHubRepositoryCreateProperties.t() | nil,
          type: String.t()
        }

  defstruct [:description, :metadata, :properties, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      metadata: {Polarex.Metadata, :t},
      properties: {:union, [{Polarex.BenefitGitHubRepositoryCreateProperties, :t}, :null]},
      type: {:const, "github_repository"}
    ]
  end
end

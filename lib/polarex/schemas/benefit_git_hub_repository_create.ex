defmodule Polarex.BenefitGitHubRepositoryCreate do
  @moduledoc """
  Provides struct and type for a BenefitGitHubRepositoryCreate
  """

  @type t :: %__MODULE__{
          description: String.t(),
          metadata: map | nil,
          organization_id: String.t() | nil,
          properties: Polarex.BenefitGitHubRepositoryCreateProperties.t(),
          type: String.t(),
          visibility: String.t() | nil
        }

  defstruct [:description, :metadata, :organization_id, :properties, :type, :visibility]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      metadata: :map,
      organization_id: {:union, [{:string, "uuid4"}, :null]},
      properties: {Polarex.BenefitGitHubRepositoryCreateProperties, :t},
      type: {:const, "github_repository"},
      visibility: {:union, [{:enum, ["draft", "private", "public"]}, :null]}
    ]
  end
end

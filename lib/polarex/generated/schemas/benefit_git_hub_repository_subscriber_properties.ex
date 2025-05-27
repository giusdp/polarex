defmodule Polarex.Generated.BenefitGitHubRepositorySubscriberProperties do
  @moduledoc """
  Provides struct and type for a BenefitGitHubRepositorySubscriberProperties
  """

  @type t :: %__MODULE__{repository_name: String.t(), repository_owner: String.t()}

  defstruct [:repository_name, :repository_owner]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [repository_name: {:string, :generic}, repository_owner: {:string, :generic}]
  end
end

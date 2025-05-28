defmodule Polarex.BenefitGitHubRepositoryProperties do
  @moduledoc """
  Provides struct and type for a BenefitGitHubRepositoryProperties
  """

  @type t :: %__MODULE__{
          permission: String.t(),
          repository_name: String.t(),
          repository_owner: String.t()
        }

  defstruct [:permission, :repository_name, :repository_owner]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      permission: {:enum, ["pull", "triage", "push", "maintain", "admin"]},
      repository_name: {:string, :generic},
      repository_owner: {:string, :generic}
    ]
  end
end

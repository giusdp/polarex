defmodule Polarex.BenefitGrantGitHubRepositoryProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantGitHubRepositoryProperties
  """

  @type t :: %__MODULE__{
          account_id: String.t() | nil,
          permission: String.t() | nil,
          repository_name: String.t() | nil,
          repository_owner: String.t() | nil
        }

  defstruct [:account_id, :permission, :repository_name, :repository_owner]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account_id: {:string, :generic},
      permission: {:enum, ["pull", "triage", "push", "maintain", "admin"]},
      repository_name: {:string, :generic},
      repository_owner: {:string, :generic}
    ]
  end
end

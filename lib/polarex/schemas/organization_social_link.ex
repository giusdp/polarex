defmodule Polarex.OrganizationSocialLink do
  @moduledoc """
  Provides struct and type for a OrganizationSocialLink
  """

  @type t :: %__MODULE__{platform: String.t(), url: String.t()}

  defstruct [:platform, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      platform:
        {:enum,
         ["x", "github", "facebook", "instagram", "youtube", "tiktok", "linkedin", "other"]},
      url: {:string, :uri}
    ]
  end
end

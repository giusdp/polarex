defmodule Polarex.CustomerOrganizationFeatureSettings do
  @moduledoc """
  Provides struct and type for a CustomerOrganizationFeatureSettings
  """

  @type t :: %__MODULE__{member_model_enabled: boolean | nil}

  defstruct [:member_model_enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [member_model_enabled: :boolean]
  end
end

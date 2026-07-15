defmodule Polarex.CustomerOrganizationFeatureSettings do
  @moduledoc """
  Provides struct and type for a CustomerOrganizationFeatureSettings
  """

  @type t :: %__MODULE__{
          checkout_localization_enabled: boolean | nil,
          member_model_enabled: boolean | nil
        }

  defstruct [:checkout_localization_enabled, :member_model_enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [checkout_localization_enabled: :boolean, member_model_enabled: :boolean]
  end
end

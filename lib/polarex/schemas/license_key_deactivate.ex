defmodule Polarex.LicenseKeyDeactivate do
  @moduledoc """
  Provides struct and type for a LicenseKeyDeactivate
  """

  @type t :: %__MODULE__{activation_id: String.t(), key: String.t(), organization_id: String.t()}

  defstruct [:activation_id, :key, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activation_id: {:string, :generic},
      key: {:string, :generic},
      organization_id: {:string, :generic}
    ]
  end
end

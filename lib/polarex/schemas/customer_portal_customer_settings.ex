defmodule Polarex.CustomerPortalCustomerSettings do
  @moduledoc """
  Provides struct and type for a CustomerPortalCustomerSettings
  """

  @type t :: %__MODULE__{allow_email_change: boolean | nil}

  defstruct [:allow_email_change]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [allow_email_change: :boolean]
  end
end

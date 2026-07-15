defmodule Polarex.BenefitGrantSlackSharedChannelProperties do
  @moduledoc """
  Provides struct and type for a BenefitGrantSlackSharedChannelProperties
  """

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          channel_name: String.t() | nil,
          connected_team_id: String.t() | nil,
          invite_id: String.t() | nil,
          invite_url: String.t() | nil,
          invited_email: String.t() | nil
        }

  defstruct [
    :channel_id,
    :channel_name,
    :connected_team_id,
    :invite_id,
    :invite_url,
    :invited_email
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: :string,
      channel_name: :string,
      connected_team_id: :string,
      invite_id: :string,
      invite_url: :string,
      invited_email: :string
    ]
  end
end

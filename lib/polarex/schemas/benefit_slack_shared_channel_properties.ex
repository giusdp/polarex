defmodule Polarex.BenefitSlackSharedChannelProperties do
  @moduledoc """
  Provides struct and type for a BenefitSlackSharedChannelProperties
  """

  @type t :: %__MODULE__{
          archive_on_revoke: boolean | nil,
          channel_name_template: String.t(),
          private: boolean | nil,
          slack_integration_id: String.t(),
          team_invitees: [String.t()] | nil,
          welcome_message: String.t() | nil
        }

  defstruct [
    :archive_on_revoke,
    :channel_name_template,
    :private,
    :slack_integration_id,
    :team_invitees,
    :welcome_message
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archive_on_revoke: :boolean,
      channel_name_template: :string,
      private: :boolean,
      slack_integration_id: {:string, "uuid4"},
      team_invitees: [:string],
      welcome_message: {:union, [:string, :null]}
    ]
  end
end

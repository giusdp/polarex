defmodule Polarex.OAuth2ClientPublic do
  @moduledoc """
  Provides struct and type for a OAuth2ClientPublic
  """

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_name: String.t() | nil,
          client_uri: String.t() | nil,
          created_at: DateTime.t(),
          logo_uri: String.t() | nil,
          modified_at: DateTime.t() | nil,
          policy_uri: String.t() | nil,
          tos_uri: String.t() | nil
        }

  defstruct [
    :client_id,
    :client_name,
    :client_uri,
    :created_at,
    :logo_uri,
    :modified_at,
    :policy_uri,
    :tos_uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: :string,
      client_name: {:union, [:string, :null]},
      client_uri: {:union, [:string, :null]},
      created_at: {:string, "date-time"},
      logo_uri: {:union, [:string, :null]},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      policy_uri: {:union, [:string, :null]},
      tos_uri: {:union, [:string, :null]}
    ]
  end
end

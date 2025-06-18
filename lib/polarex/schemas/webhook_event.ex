defmodule Polarex.WebhookEvent do
  @moduledoc """
  Provides struct and type for a WebhookEvent
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          last_http_code: integer | nil,
          modified_at: DateTime.t() | nil,
          payload: String.t(),
          succeeded: boolean | nil
        }

  defstruct [:created_at, :id, :last_http_code, :modified_at, :payload, :succeeded]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: {:string, :generic},
      last_http_code: {:union, [:integer, :null]},
      modified_at: {:union, [{:string, :date_time}, :null]},
      payload: {:string, :generic},
      succeeded: {:union, [:boolean, :null]}
    ]
  end
end

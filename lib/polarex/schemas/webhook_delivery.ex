defmodule Polarex.WebhookDelivery do
  @moduledoc """
  Provides struct and type for a WebhookDelivery
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          http_code: integer | nil,
          id: String.t(),
          modified_at: DateTime.t() | nil,
          response: String.t() | nil,
          succeeded: boolean,
          webhook_event: Polarex.WebhookEvent.t()
        }

  defstruct [:created_at, :http_code, :id, :modified_at, :response, :succeeded, :webhook_event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      http_code: {:union, [:integer, :null]},
      id: {:string, "uuid4"},
      modified_at: {:union, [{:string, "date-time"}, :null]},
      response: {:union, [:string, :null]},
      succeeded: :boolean,
      webhook_event: {Polarex.WebhookEvent, :t}
    ]
  end
end

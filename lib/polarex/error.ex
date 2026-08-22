defmodule Polarex.Error do
  @moduledoc """
  A failed Polar API call.

  Every operation returns `{:error, %Polarex.Error{}}` on failure:

    * `status` - the HTTP status, or `nil` for transport errors
    * `message` - a human-readable description
    * `validation_errors` - decoded `Polarex.ValidationError` structs on 422s
    * `body` - the raw decoded response body, if any
    * `reason` - the transport error reason, when the request never got a response

  It is an exception, so it can also be raised directly.
  """

  defexception [:status, :message, :reason, :body, validation_errors: []]

  @type t :: %__MODULE__{
          status: integer | nil,
          message: String.t(),
          reason: term,
          body: term,
          validation_errors: [Polarex.ValidationError.t()]
        }
end

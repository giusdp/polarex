defmodule Polarex.Support.Client do
  @moduledoc """
  This module is not automatically generated.
  It executes the requests described by the generated operation modules using
  `Req`, translating successful responses into their typed structs.

  Extra `Req` options can be set globally with `config :polarex, req_options:`
  and per call with the `req_options:` option; the per-call ones win. Emits
  `[:polarex, :request, :start | :stop | :exception]` telemetry events with the
  operation, method and url as metadata.

  Requests are only retried when they are safe to repeat (GET); mutating
  requests are never retried automatically. Override through `req_options` if
  you know better.
  """
  alias Polarex.Support.Translator

  def request(%{method: method, url: url, call: call} = descriptor) do
    metadata = %{operation: call, method: method, url: url}

    :telemetry.span([:polarex, :request], metadata, fn ->
      result =
        descriptor
        |> build_request()
        |> Req.request()
        |> handle_response(descriptor)

      {result, Map.put(metadata, :result, elem(result, 0))}
    end)
  end

  defp build_request(%{method: method, url: url} = descriptor) do
    [
      url: build_endpoint(url),
      method: method,
      body: encode_body(descriptor[:body]),
      params: Map.get(descriptor, :query, %{}),
      auth: {:bearer, Application.fetch_env!(:polarex, :access_token)},
      headers:
        [{"content-type", "application/json"}] ++ Keyword.get(descriptor.opts, :headers, []),
      retry: retry_policy(method)
    ]
    |> Keyword.merge(Application.get_env(:polarex, :req_options, []))
    |> Keyword.merge(Keyword.get(descriptor.opts, :req_options, []))
    |> Req.new()
  end

  # Only idempotent requests may be repeated without asking the caller.
  defp retry_policy(:get), do: :safe_transient
  defp retry_policy(_method), do: false

  defp handle_response({:ok, %Req.Response{status: status, body: body}}, descriptor)
       when status < 300 do
    case body do
      empty when empty in [nil, ""] ->
        {:ok, nil}

      body ->
        lookup = Map.new(descriptor.response)
        result_type = Map.get(lookup, status)
        {:ok, Translator.translate(result_type, body)}
    end
  end

  defp handle_response({:ok, %Req.Response{status: status, body: body}}, descriptor) do
    lookup = Map.new(descriptor.response)

    decoded =
      case Map.get(lookup, status) do
        nil -> nil
        result_type -> Translator.translate(result_type, body)
      end

    {:error,
     %Polarex.Error{
       status: status,
       message: error_message(status, body),
       validation_errors: validation_errors(decoded),
       body: body
     }}
  end

  defp handle_response({:error, %{reason: reason}}, _descriptor) do
    {:error, %Polarex.Error{reason: reason, message: "transport error: #{inspect(reason)}"}}
  end

  defp handle_response({:error, exception}, _descriptor) do
    {:error, %Polarex.Error{reason: exception, message: "transport error: #{inspect(exception)}"}}
  end

  defp error_message(_status, %{"message" => message}) when is_binary(message), do: message
  defp error_message(_status, %{"detail" => detail}) when is_binary(detail), do: detail
  defp error_message(status, _body), do: "HTTP response status: #{status}"

  defp validation_errors(%Polarex.HTTPValidationError{detail: detail}) when is_list(detail),
    do: detail

  defp validation_errors(_decoded), do: []

  defp build_endpoint(path) do
    :polarex
    |> Application.fetch_env!(:server)
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end

  defp encode_body(nil), do: nil
  defp encode_body(body), do: body |> deep_unstruct() |> JSON.encode!()

  @calendar_structs [DateTime, Date, Time, NaiveDateTime]

  defp deep_unstruct(%mod{} = value) when mod in @calendar_structs, do: value

  defp deep_unstruct(%{__struct__: _} = struct) do
    struct |> Map.from_struct() |> deep_unstruct()
  end

  defp deep_unstruct(map) when is_map(map) do
    map
    |> Map.reject(fn {_key, value} -> is_nil(value) end)
    |> Map.new(fn {key, value} -> {key, deep_unstruct(value)} end)
  end

  defp deep_unstruct(list) when is_list(list), do: Enum.map(list, &deep_unstruct/1)
  defp deep_unstruct(value), do: value
end

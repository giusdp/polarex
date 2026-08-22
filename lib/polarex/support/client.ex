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
      headers: [{"content-type", "application/json"}] ++ Keyword.get(descriptor.opts, :headers, []),
      retry: retry_policy(method)
    ]
    |> Keyword.merge(Application.get_env(:polarex, :req_options, []))
    |> Keyword.merge(Keyword.get(descriptor.opts, :req_options, []))
    |> Req.new()
  end

  # Only idempotent requests may be repeated without asking the caller.
  defp retry_policy(:get), do: :safe_transient
  defp retry_policy(_method), do: false

  defp handle_response({:ok, %Req.Response{status: status, body: nil}}, _descriptor) when status < 300 do
    {:error, nil}
  end

  defp handle_response({:ok, %Req.Response{status: status, body: body}}, descriptor) when status < 300 do
    lookup = Map.new(descriptor.response)
    result_type = Map.get(lookup, status)
    {:ok, Translator.translate(result_type, body)}
  end

  defp handle_response({:ok, %Req.Response{body: %{"message" => message}}}, _descriptor) do
    {:error, message}
  end

  defp handle_response({:ok, %Req.Response{status: status}}, _descriptor) do
    {:error, "HTTP response status: #{inspect(status)}"}
  end

  defp handle_response({:error, %{reason: reason}}, _descriptor), do: {:error, reason}
  defp handle_response({:error, exception}, _descriptor), do: {:error, exception}

  defp build_endpoint(path) do
    :polarex
    |> Application.fetch_env!(:server)
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end

  defp encode_body(nil), do: nil

  defp encode_body(%{__struct__: _} = body) do
    body
    |> Map.from_struct()
    |> encode_body()
  end

  defp encode_body(body) when is_map(body) do
    body
    |> Map.reject(fn {_, v} -> is_nil(v) end)
    |> JSON.encode!()
  end
end

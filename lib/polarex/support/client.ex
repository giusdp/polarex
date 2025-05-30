defmodule Polarex.Support.Client do
  @moduledoc """
  This module is not automatically generated.
  It is manually created to provide a Req request client for the Polar API.
  """
  alias Polarex.Support.Translator

  def request(opts) do
    case execute_request(opts) do
      {:ok, %{status: status, body: nil}} when status < 300 ->
        {:error, nil}

      {:ok, %{status: status, body: body}} when status < 300 ->
        lookup = Map.new(opts.response)
        result_type = Map.get(lookup, status)
        {:ok, Translator.translate(result_type, body)}

      {:ok, %{body: %{"message" => message}}} ->
        {:error, message}

      {:ok, %{status: status}} ->
        reason = "HTTP response status: #{inspect(status)}"
        {:error, reason}

      {:error, %{reason: reason}} ->
        {:error, reason}
    end
  end

  defp execute_request(%{method: :get} = opts) do
    # Coalescing the params key so it doesn't blow up
    # https://github.com/wojtekmach/req/issues/422

    [
      url: build_endpoint(opts.url),
      params: Map.get(opts, :query, %{})
    ]
    |> Req.new()
    |> add_headers()
    |> Req.get()
  end

  defp execute_request(%{method: :post} = opts) do
    [
      url: build_endpoint(opts.url),
      body: encode_body(opts[:body]),
      retry: :transient
    ]
    |> Req.new()
    |> add_headers()
    |> Req.post()
  end

  defp execute_request(%{method: :patch} = opts) do
    [
      url: build_endpoint(opts.url),
      body: encode_body(opts[:body]),
      retry: :transient
    ]
    |> Req.new()
    |> add_headers()
    |> Req.patch()
  end

  defp execute_request(%{method: :put} = opts) do
    [
      url: build_endpoint(opts.url),
      body: encode_body(opts[:body]),
      retry: :transient
    ]
    |> Req.new()
    |> add_headers()
    |> Req.put()
  end

  # Helper function to build the URL
  defp build_endpoint(path) do
    host = Application.fetch_env!(:polarex, :server)

    host
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end

  # Ensure the body is encoded as JSON
  defp encode_body(nil), do: nil
  defp encode_body(body), do: Jason.encode!(body)

  defp add_headers(%Req.Request{} = req) do
    access_token = Application.fetch_env!(:polarex, :access_token)

    Req.merge(req,
      headers: [
        {"Authorization", "Bearer #{access_token}"},
        {"Content-Type", "application/json"}
      ]
    )
  end
end

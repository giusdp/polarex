defmodule Mix.Tasks.Spec.Sync do
  @shortdoc "Downloads the Polar OpenAPI spec into openapi.json"
  @moduledoc """
  Downloads the Polar OpenAPI spec for one API version into `openapi.json`.

      mix spec.sync            # refresh the version openapi.json is already on
      mix spec.sync 2026-10    # switch to a specific version
      mix spec.sync --current  # switch to the version Polar serves as Current

  Polar publishes one spec per version at `https://api.polar.sh/<version>/openapi.json`
  and reports its Current version in the `polar-version` header of every response.
  """
  use Mix.Task

  @api "https://api.polar.sh"
  @spec_path "openapi.json"

  @impl Mix.Task
  def run(args) do
    {:ok, _} = Application.ensure_all_started(:req)

    version =
      case OptionParser.parse!(args, strict: [current: :boolean]) do
        {[current: true], []} -> current_version!()
        {[], [version]} -> version
        {[], []} -> pinned_version!()
        _ -> Mix.raise("Usage: mix spec.sync [VERSION | --current]")
      end

    if not Regex.match?(~r/^\d{4}-\d{2}$/, version) do
      Mix.raise("Invalid Polar API version #{inspect(version)}, expected YYYY-MM")
    end

    File.write!(@spec_path, fetch_spec!(version))
    Mix.shell().info("#{@spec_path} is now Polar API #{version}")
  end

  defp current_version! do
    response = Req.get!(@api <> "/healthz")

    case Req.Response.get_header(response, "polar-version") do
      [version] -> version
      _ -> Mix.raise("#{@api}/healthz did not report a polar-version header")
    end
  end

  defp pinned_version! do
    case File.read(@spec_path) do
      {:ok, contents} -> spec_version(JSON.decode!(contents))
      {:error, _} -> Mix.raise("No #{@spec_path} yet: pass a version or --current")
    end
  end

  # The raw body is written as served so spec diffs only show Polar's changes.
  defp fetch_spec!(version) do
    url = "#{@api}/#{version}/openapi.json"

    case Req.get!(url, decode_body: false) do
      %Req.Response{status: 200, body: body} ->
        served = body |> JSON.decode!() |> spec_version()

        if served != version do
          Mix.raise("#{url} served spec version #{inspect(served)}, expected #{version}")
        end

        body

      %Req.Response{status: status} ->
        Mix.raise("#{url} returned HTTP #{status}; is #{version} a released Polar API version?")
    end
  end

  defp spec_version(%{"info" => %{"version" => version}}) when is_binary(version), do: version
  defp spec_version(_spec), do: Mix.raise("Spec has no info.version")
end

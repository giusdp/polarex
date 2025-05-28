defmodule Mix.Tasks.Spec.Sync do
  @moduledoc false
  use Mix.Task

  @url "https://api.polar.sh/openapi.json"
  @spec_path "openapi.json"

  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:req)
    Req.get!(@url, raw: true, into: File.stream!(@spec_path, [:write]))
  end
end

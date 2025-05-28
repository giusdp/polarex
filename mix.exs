defmodule Polarex.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :polarex,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      package: package(),
      docs: docs(),
      name: "Polarex",
      source_url: "https://github.com/giusdp/polarex",
      homepage_url: "https://github.com/giusdp/polarex",
      description: """
      Elixir SDK for Polar.sh.
      """
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Giuseppe De Palma"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/giusdp/polarex"
      },
      files: files()
    ]
  end

  defp files do
    ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE* license*)
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "main",
      source_url: "https://github.com/giusdp/polarex"
    ]
  end

  defp deps do
    [
      {:req, "~> 0.5"},
      {:oapi_generator, "~> 0.2.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      "sdk.build": ["spec.sync", "api.gen default openapi.json"]
    ]
  end
end

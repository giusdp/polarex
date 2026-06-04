defmodule Polarex.MixProject do
  use Mix.Project

  def project do
    [
      app: :polarex,
      version: "0.0.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      package: package(),
      docs: docs(),
      name: "Polarex",
      source_url: "https://github.com/spapiernik/polarex-nightly",
      homepage_url: "https://github.com/spapiernik/polarex-nightly",
      description: """
      Elixir SDK for Polar.sh — nightly track.
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
      maintainers: ["spapiernik"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/spapiernik/polarex-nightly"
      },
      files: files()
    ]
  end

  defp files do
    ~w(lib .formatter.exs mix.exs README* LICENSE*)
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "nightly",
      source_url: "https://github.com/spapiernik/polarex-nightly"
    ]
  end

  defp deps do
    [
      {:req, "~> 0.5"},
      {:oapi_generator, "~> 0.4.0", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      "sdk.build": ["spec.sync", "api.gen default openapi.json"]
    ]
  end
end

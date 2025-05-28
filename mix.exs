defmodule Polarex.MixProject do
  use Mix.Project

  def project do
    [
      app: :polarex,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
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

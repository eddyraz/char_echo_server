defmodule Charserver.MixProject do
  use Mix.Project

  def project do
    [
      app: :charserver,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:cowboy, "~> 2.4"},
      {:jason, "~> 1.1"},
      {:websockex, "~> 0.4.3"},
      {:cowlib, "~> 2.11.0"},
      {:ranch, "~> 1.8.0"},
    ]
  end
end

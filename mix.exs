defmodule BasecampGiphyElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :basecamp_giphy_elixir,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BasecampGiphyElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:poison, "~> 3.1"},
      {:plug, "~> 1.8"},
      {:cowboy, "~> 2.6"},
      {:plug_cowboy, "~> 2.1"},
      {:giphy, "~> 0.1.1"}
    ]
  end
end

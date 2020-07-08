defmodule UtilsHttp.MixProject do
  use Mix.Project

  def project do
    [
      app: :utils_http,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: "Utilities to work with HTTP in Elixir",
      package: package(),
      deps: deps(),
      dialyzer: [plt_add_apps: [:mix]]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Vyacheslav Voronchuk"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Voronchuk/utils_http"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.0"},
      {:httpoison, "~> 1.6"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end

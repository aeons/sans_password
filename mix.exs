defmodule Passwordless.Mixfile do
  use Mix.Project

  def project do
    [app: :passwordless,
     version: "0.1.0",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: applications(Mix.env)]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ecto, "~> 2.0"},
     {:guardian, "~> 0.13"},
     {:phoenix, "~> 1.2", optional: true},
     {:postgrex, "~> 0.12", only: :test}]
  end

  defp applications(:test), do: [:logger, :phoenix, :phoenix_html, :ecto, :postgrex]
  defp applications(_),     do: [:logger, :phoenix, :phoenix_html, :ecto]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end

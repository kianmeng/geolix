defmodule Geolix.Mixfile do
  use Mix.Project

  @url_github "https://github.com/mneudert/geolix"

  def project do
    [ app:           :geolix,
      name:          "Geolix",
      description:   "MaxMind GeoIP2 database reader/decoder",
      package:       package,
      version:       "0.10.0-dev",
      elixir:        "~> 1.0",
      deps:          deps(Mix.env),
      docs:          docs,
      test_coverage: [ tool: ExCoveralls ]]
  end

  def application do
    [ applications: [ :logger, :poolboy ],
      mod:          { Geolix, [] } ]
  end

  def deps(:docs) do
    deps(:prod) ++
      [ { :earmark, "~> 0.2",  optional: true },
        { :ex_doc,  "~> 0.11", optional: true } ]
  end

  def deps(:test) do
    deps(:prod) ++
      [ { :dialyze,     "~> 0.2", optional: true },
        { :excoveralls, "~> 0.4", optional: true } ]
  end

  def deps(_) do
    [ { :poolboy, "~> 1.0" } ]
  end

  def docs do
    [ extras:     [ "CHANGELOG.md", "README.md" ],
      main:       "readme",
      source_ref: "master",
      source_url: @url_github ]
  end

  def package do
    %{ files:       [ "CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib" ],
       licenses:    [ "Apache 2.0" ],
       links:       %{ "GitHub" => @url_github },
       maintainers: [ "Marc Neudert" ]}
  end
end

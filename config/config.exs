# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :upsert_issue,
  ecto_repos: [UpsertIssue.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :upsert_issue, UpsertIssueWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wRhaAjX5m8GiYs2yjIbS4e0dk95GA2d1jz/374BVCuSLkdZkx9ymsvJ01Lr8Gljk",
  render_errors: [view: UpsertIssueWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: UpsertIssue.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

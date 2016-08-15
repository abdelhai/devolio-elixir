# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :devolio,
  ecto_repos: [Devolio.Repo]

# Configures the endpoint
config :devolio, Devolio.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "txQrJDGzGa6Uy8MkMX/flelz3Vs4POQOo45z8CUM7G3EvyUmgXAeIUH6+8KX3oeq",
  render_errors: [view: Devolio.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Devolio.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

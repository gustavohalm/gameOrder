# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gameOrder,
  ecto_repos: [GameOrder.Repo]

# Configures the endpoint
config :gameOrder, GameOrderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OYwYdn4xSDZkP2vyqrFUFh2gQM1GoqZ7ieJ5eZAEji/jQ9b+o5ek9fzH0o3aaDcl",
  render_errors: [view: GameOrderWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GameOrder.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

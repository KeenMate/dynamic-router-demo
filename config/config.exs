# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :dynamic_router,
  ecto_repos: [DynamicRouter.Repo]

# Configures the endpoint
config :dynamic_router, DynamicRouterWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: DynamicRouterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DynamicRouter.PubSub,
  live_view: [signing_salt: "yqd8LUaC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

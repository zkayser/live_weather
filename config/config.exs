# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_weather,
  ecto_repos: [LiveWeather.Repo]

# Configures the endpoint
config :live_weather, LiveWeatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cex/4D6Lw8Vcxgloi4ezR743vKRtpr/GObqr5ekmqAwiQuig9LCf2MWQJ2rwLk/J",
  render_errors: [view: LiveWeatherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveWeather.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

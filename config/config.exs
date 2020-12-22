# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sample_api,
  ecto_repos: [SampleApi.Repo]

# Configures the endpoint
config :sample_api, SampleApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eG4TvcNH9vh2uk2tKsSGdeEZ/iqFcq0mwoVmHnHz5Whsdhu+io5P+UQyUI9Fc5cH",
  render_errors: [view: SampleApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SampleApi.PubSub,
  live_view: [signing_salt: "c3sJa9Ta"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :casthost,
  ecto_repos: [Casthost.Repo]

# Configures the endpoint
config :casthost, CasthostWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mfP2RAxDtjnoxEBoYTNOnliTdlbvEejeGgWvgzUJSUA/Q5x0s9GnEs95dpljED9H",
  render_errors: [view: CasthostWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Casthost.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]
  
# Configures Guardian
config :casthost, Rumbl.Auth.Guardian,
  issuer: "casthost",
  secret_key: "HNinpKh9Ne3tr8BpjCpAEh0xzCqTIG3PWsfkR2AtzvUaRIpbs6oIQ9RcmjmGPekJ"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

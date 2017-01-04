# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :saas_example,
  ecto_repos: [SaasExample.Repo]

# Configures the endpoint
config :saas_example, SaasExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iSQWqtzb3Q67Cq2i0qyGDpVE1svns2B19AA5ThecM3AvM+DKc+S1UiRrx8p0RQvv",
  render_errors: [view: SaasExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SaasExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: SaasExample.User,
  repo: SaasExample.Repo,
  module: SaasExample,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%

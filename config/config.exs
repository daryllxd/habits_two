# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :habits_two,
  ecto_repos: [HabitsTwo.Repo]

# Configures the endpoint
config :habits_two, HabitsTwoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qw7WqXOJH15Dh/jYdsFkSc8/lxDp2f1QnVzfFtfJxmBpfoTXa4296+HSV8AqO8tw",
  render_errors: [view: HabitsTwoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HabitsTwo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

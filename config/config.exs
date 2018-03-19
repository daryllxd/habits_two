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
  secret_key_base: "cnIxqk83ZYOvnN0OxSDiPsU3Ua/es0eTvW+oN0dyEaAutN6kR+stvPLoyDbnglJZ",
  render_errors: [view: HabitsTwoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HabitsTwo.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :habits_two, HabitsTwo.Auth.Guardian,
       issuer: "habits_two",
       secret_key: "3ZO4NMnWk4t3LB51zto/nOu92rglPLlGAUWxzMT1Q/WvxidAaP174jRPg8Xj6ydG"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :scrivener_html,
  routes_helper: MyApp.Router.Helpers,
  view_style: :bootstrap_v4

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

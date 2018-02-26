defmodule HabitsTwoWeb.Router do
  use HabitsTwoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug HabitsTwo.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", HabitsTwoWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :login
    resources "users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HabitsTwoWeb do
  #   pipe_through :api
  # end
end

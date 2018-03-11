defmodule HabitsTwoWeb.HabitController do
  use HabitsTwoWeb, :controller

  alias HabitsTwo.Repo
  alias HabitsTwo.Auth
  alias HabitsTwo.Auth.User
  alias HabitsTwo.Auth.Guardian

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end

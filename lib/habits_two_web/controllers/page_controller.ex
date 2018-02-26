defmodule HabitsTwoWeb.PageController do
  use HabitsTwoWeb, :controller

  def index(conn, _params) do
    conn
    |> render "index.html"
  end
end

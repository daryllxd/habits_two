defmodule HabitsTwoWeb.PageController do
  use HabitsTwoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

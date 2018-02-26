defmodule HabitsTwoWeb.UserController do
  use HabitsTwoWeb, :controller

  alias HabitsTwo.Repo
  alias HabitsTwo.Auth
  alias HabitsTwo.Auth.User
  alias HabitsTwo.Auth.Guardian

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{email: '', password: ''})

    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      { :ok, user } ->
        conn
        |> put_flash(:info, "#{user.email} created!")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end

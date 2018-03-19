defmodule HabitsTwoWeb.HabitController do
  use HabitsTwoWeb, :controller

  # Not sure if there is a better solution to this, I just need `Guardian.Plug` so I can access current_resource
  import Guardian.Plug

  alias HabitsTwo.Repo
  alias HabitsTwo.Habit

  def index(conn, _params) do
    current_user_id = current_resource(conn).id

    habits = Habit
              |> Habit.of_user(current_user_id)
              |> Repo.all

    conn
    |> render("index.html", habits: habits)
  end

  def new(conn, _params) do
    changeset = Habit.changeset(%Habit{}, %{email: '', password: ''})

    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"habit" => habit_params}) do
    complete_params = habit_params
                      |> IO.inspect
                      |> Map.put("created_by_user_id", current_resource(conn).id)

    changeset = Habit.changeset(%Habit{}, complete_params)

    case Repo.insert(changeset) do
      { :ok, habit } ->
        conn
        |> put_flash(:info, "#{habit.title} created!")
        |> redirect(to: habit_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    habit = Habit.get_habit(id)

    case Repo.delete(habit) do
      { :ok, habit } ->
        conn
        |> put_flash(:info, "#{habit.title} deleted!")
        |> redirect(to: habit_path(conn, :index))
      { :error, habit } ->
        conn
        |> put_flash(:error, "Can't delete.")
        |> redirect(to: habit_path(conn, :index))
    end
  end

  defp pry(e) do
    require IEx; IEx.pry
    e
  end
end

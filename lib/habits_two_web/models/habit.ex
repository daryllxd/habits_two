defmodule HabitsTwo.Habit do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias HabitsTwo.Habit
  alias HabitsTwo.Auth.User

  schema "habits" do
    field :title, :string
    field :description, :string

    belongs_to :created_by_user, HabitsTwo.Auth.User

    timestamps()
  end

  def changeset(%Habit{} = user, attrs) do
    user
    |> cast(attrs, [:title, :description, :created_by_user_id])
    |> validate_required([:title, :description, :created_by_user_id])
  end

  def of_user(query, user_id) do
    from u in query,
    where: u.created_by_user_id == ^user_id
  end
end


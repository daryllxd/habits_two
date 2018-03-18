defmodule HabitsTwo.Habit do
  use Ecto.Schema
  import Ecto.Changeset

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
end


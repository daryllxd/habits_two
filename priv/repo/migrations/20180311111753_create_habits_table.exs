defmodule HabitsTwo.Repo.Migrations.CreateHabits do
  use Ecto.Migration

  def change do
    create table(:habits) do
      add :created_by_user_id, references(:users), null: false

      add :title, :string, null: false
      add :description, :text

      timestamps()
    end

    create index(:habits, [:created_by_user_id, :title], unique: true)
  end
end

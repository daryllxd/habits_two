defmodule HabitsTwo.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias HabitsTwo.Repo
  alias HabitsTwo.Auth.User
  alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :password, :string

    has_many :habits, HabitsTwo.Habit

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_pass_hash
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end

  defp put_pass_hash(changeset), do: changeset
end

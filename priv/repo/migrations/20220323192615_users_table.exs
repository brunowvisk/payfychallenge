defmodule Payfychallenge.Repo.Migrations.UsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
    end

  create unique_index(:users, [:email])
  end
end

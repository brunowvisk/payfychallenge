defmodule Payfychallenge.Repo.Migrations.ConfigusersTable do
  use Ecto.Migration

  def change do
    create table(:configusers) do
      add :theme, {:array, :string}, default: ["dark", "medium", "light"]
      add :notificationemail, :boolean
      add :user_id, references(:users, type: :binary_id)
    end
  end
end

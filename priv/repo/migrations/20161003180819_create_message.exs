defmodule Devolio.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :space_id, references(:spaces, on_delete: :nothing)

      timestamps()
    end
    create index(:messages, [:user_id])
    create index(:messages, [:space_id])

  end
end

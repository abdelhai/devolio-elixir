defmodule Devolio.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :description, :string
      add :type, :integer
      add :space_id, references(:spaces, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:channels, [:space_id])
    create index(:channels, [:user_id])

  end
end

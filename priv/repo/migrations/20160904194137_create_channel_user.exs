defmodule Devolio.Repo.Migrations.CreateChannelUser do
  use Ecto.Migration

  def change do
    create table(:channels_users) do
      add :channel_id, references(:channels, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:channels_users, [:channel_id])
    create index(:channels_users, [:user_id])

  end
end

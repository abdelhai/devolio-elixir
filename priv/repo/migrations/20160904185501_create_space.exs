defmodule Devolio.Repo.Migrations.CreateSpace do
  use Ecto.Migration

  def change do
    create table(:spaces) do
      add :name, :string

      timestamps()
    end

  end
end

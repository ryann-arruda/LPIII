defmodule Movielist.Repo.Migrations.CreateGeneros do
  use Ecto.Migration

  def change do
    create table(:generos) do
      add :nome, :string

      timestamps()
    end
  end
end

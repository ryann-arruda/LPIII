defmodule Movielist.Repo.Migrations.CreateFilmes do
  use Ecto.Migration

  def change do
    create table(:filmes) do
      add :titulo, :string
      add :diretor, :string
      add :ano, :string
      add :duracao, :string
      add :genero_id, references(:generos, on_delete: :nothing)
      add :assistido_id, references(:assistidos, on_delete: :nothing)

      timestamps()
    end

    create index(:filmes, [:genero_id])
    create index(:filmes, [:assistido_id])
  end
end

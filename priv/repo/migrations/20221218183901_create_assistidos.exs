defmodule Movielist.Repo.Migrations.CreateAssistidos do
  use Ecto.Migration

  def change do
    create table(:assistidos) do
      add :resposta, :string
      add :confirmacao, :string

      timestamps()
    end
  end
end

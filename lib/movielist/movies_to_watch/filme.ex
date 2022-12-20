defmodule Movielist.MoviesToWatch.Filme do
  use Ecto.Schema
  import Ecto.Changeset

  schema "filmes" do
    field :ano, :string
    field :diretor, :string
    field :duracao, :string
    field :titulo, :string
    field :genero_id, :id
    field :assistido_id, :id

    timestamps()
  end

  @doc false
  def changeset(filme, attrs) do
    filme
    |> cast(attrs, [:titulo, :diretor, :ano, :duracao, :genero_id, :assistido_id])
    |> validate_required([:titulo, :diretor, :ano, :duracao, :genero_id, :assistido_id])
  end
end

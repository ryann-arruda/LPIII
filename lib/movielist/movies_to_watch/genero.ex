defmodule Movielist.MoviesToWatch.Genero do
  use Ecto.Schema
  import Ecto.Changeset

  schema "generos" do
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(genero, attrs) do
    genero
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end

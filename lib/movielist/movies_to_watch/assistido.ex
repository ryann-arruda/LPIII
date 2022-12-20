defmodule Movielist.MoviesToWatch.Assistido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assistidos" do
    field :confirmacao, :string
    field :resposta, :string

    timestamps()
  end

  @doc false
  def changeset(assistido, attrs) do
    assistido
    |> cast(attrs, [:resposta, :confirmacao])
    |> validate_required([:resposta, :confirmacao])
  end
end

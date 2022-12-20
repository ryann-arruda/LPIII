defmodule Movielist.MoviesToWatchFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Movielist.MoviesToWatch` context.
  """

  @doc """
  Generate a genero.
  """
  def genero_fixture(attrs \\ %{}) do
    {:ok, genero} =
      attrs
      |> Enum.into(%{
        nome: "some nome"
      })
      |> Movielist.MoviesToWatch.create_genero()

    genero
  end

  @doc """
  Generate a assistido.
  """
  def assistido_fixture(attrs \\ %{}) do
    {:ok, assistido} =
      attrs
      |> Enum.into(%{
        confirmacao: "some confirmacao",
        resposta: "some resposta"
      })
      |> Movielist.MoviesToWatch.create_assistido()

    assistido
  end

  @doc """
  Generate a filme.
  """
  def filme_fixture(attrs \\ %{}) do
    {:ok, filme} =
      attrs
      |> Enum.into(%{
        ano: "some ano",
        diretor: "some diretor",
        duracao: "some duracao",
        titulo: "some titulo"
      })
      |> Movielist.MoviesToWatch.create_filme()

    filme
  end
end

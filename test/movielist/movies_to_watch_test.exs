defmodule Movielist.MoviesToWatchTest do
  use Movielist.DataCase

  alias Movielist.MoviesToWatch

  describe "generos" do
    alias Movielist.MoviesToWatch.Genero

    import Movielist.MoviesToWatchFixtures

    @invalid_attrs %{nome: nil}

    test "list_generos/0 returns all generos" do
      genero = genero_fixture()
      assert MoviesToWatch.list_generos() == [genero]
    end

    test "get_genero!/1 returns the genero with given id" do
      genero = genero_fixture()
      assert MoviesToWatch.get_genero!(genero.id) == genero
    end

    test "create_genero/1 with valid data creates a genero" do
      valid_attrs = %{nome: "some nome"}

      assert {:ok, %Genero{} = genero} = MoviesToWatch.create_genero(valid_attrs)
      assert genero.nome == "some nome"
    end

    test "create_genero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MoviesToWatch.create_genero(@invalid_attrs)
    end

    test "update_genero/2 with valid data updates the genero" do
      genero = genero_fixture()
      update_attrs = %{nome: "some updated nome"}

      assert {:ok, %Genero{} = genero} = MoviesToWatch.update_genero(genero, update_attrs)
      assert genero.nome == "some updated nome"
    end

    test "update_genero/2 with invalid data returns error changeset" do
      genero = genero_fixture()
      assert {:error, %Ecto.Changeset{}} = MoviesToWatch.update_genero(genero, @invalid_attrs)
      assert genero == MoviesToWatch.get_genero!(genero.id)
    end

    test "delete_genero/1 deletes the genero" do
      genero = genero_fixture()
      assert {:ok, %Genero{}} = MoviesToWatch.delete_genero(genero)
      assert_raise Ecto.NoResultsError, fn -> MoviesToWatch.get_genero!(genero.id) end
    end

    test "change_genero/1 returns a genero changeset" do
      genero = genero_fixture()
      assert %Ecto.Changeset{} = MoviesToWatch.change_genero(genero)
    end
  end

  describe "assistidos" do
    alias Movielist.MoviesToWatch.Assistido

    import Movielist.MoviesToWatchFixtures

    @invalid_attrs %{confirmacao: nil, resposta: nil}

    test "list_assistidos/0 returns all assistidos" do
      assistido = assistido_fixture()
      assert MoviesToWatch.list_assistidos() == [assistido]
    end

    test "get_assistido!/1 returns the assistido with given id" do
      assistido = assistido_fixture()
      assert MoviesToWatch.get_assistido!(assistido.id) == assistido
    end

    test "create_assistido/1 with valid data creates a assistido" do
      valid_attrs = %{confirmacao: "some confirmacao", resposta: "some resposta"}

      assert {:ok, %Assistido{} = assistido} = MoviesToWatch.create_assistido(valid_attrs)
      assert assistido.confirmacao == "some confirmacao"
      assert assistido.resposta == "some resposta"
    end

    test "create_assistido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MoviesToWatch.create_assistido(@invalid_attrs)
    end

    test "update_assistido/2 with valid data updates the assistido" do
      assistido = assistido_fixture()
      update_attrs = %{confirmacao: "some updated confirmacao", resposta: "some updated resposta"}

      assert {:ok, %Assistido{} = assistido} = MoviesToWatch.update_assistido(assistido, update_attrs)
      assert assistido.confirmacao == "some updated confirmacao"
      assert assistido.resposta == "some updated resposta"
    end

    test "update_assistido/2 with invalid data returns error changeset" do
      assistido = assistido_fixture()
      assert {:error, %Ecto.Changeset{}} = MoviesToWatch.update_assistido(assistido, @invalid_attrs)
      assert assistido == MoviesToWatch.get_assistido!(assistido.id)
    end

    test "delete_assistido/1 deletes the assistido" do
      assistido = assistido_fixture()
      assert {:ok, %Assistido{}} = MoviesToWatch.delete_assistido(assistido)
      assert_raise Ecto.NoResultsError, fn -> MoviesToWatch.get_assistido!(assistido.id) end
    end

    test "change_assistido/1 returns a assistido changeset" do
      assistido = assistido_fixture()
      assert %Ecto.Changeset{} = MoviesToWatch.change_assistido(assistido)
    end
  end

  describe "filmes" do
    alias Movielist.MoviesToWatch.Filme

    import Movielist.MoviesToWatchFixtures

    @invalid_attrs %{ano: nil, diretor: nil, duracao: nil, titulo: nil}

    test "list_filmes/0 returns all filmes" do
      filme = filme_fixture()
      assert MoviesToWatch.list_filmes() == [filme]
    end

    test "get_filme!/1 returns the filme with given id" do
      filme = filme_fixture()
      assert MoviesToWatch.get_filme!(filme.id) == filme
    end

    test "create_filme/1 with valid data creates a filme" do
      valid_attrs = %{ano: "some ano", diretor: "some diretor", duracao: "some duracao", titulo: "some titulo"}

      assert {:ok, %Filme{} = filme} = MoviesToWatch.create_filme(valid_attrs)
      assert filme.ano == "some ano"
      assert filme.diretor == "some diretor"
      assert filme.duracao == "some duracao"
      assert filme.titulo == "some titulo"
    end

    test "create_filme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MoviesToWatch.create_filme(@invalid_attrs)
    end

    test "update_filme/2 with valid data updates the filme" do
      filme = filme_fixture()
      update_attrs = %{ano: "some updated ano", diretor: "some updated diretor", duracao: "some updated duracao", titulo: "some updated titulo"}

      assert {:ok, %Filme{} = filme} = MoviesToWatch.update_filme(filme, update_attrs)
      assert filme.ano == "some updated ano"
      assert filme.diretor == "some updated diretor"
      assert filme.duracao == "some updated duracao"
      assert filme.titulo == "some updated titulo"
    end

    test "update_filme/2 with invalid data returns error changeset" do
      filme = filme_fixture()
      assert {:error, %Ecto.Changeset{}} = MoviesToWatch.update_filme(filme, @invalid_attrs)
      assert filme == MoviesToWatch.get_filme!(filme.id)
    end

    test "delete_filme/1 deletes the filme" do
      filme = filme_fixture()
      assert {:ok, %Filme{}} = MoviesToWatch.delete_filme(filme)
      assert_raise Ecto.NoResultsError, fn -> MoviesToWatch.get_filme!(filme.id) end
    end

    test "change_filme/1 returns a filme changeset" do
      filme = filme_fixture()
      assert %Ecto.Changeset{} = MoviesToWatch.change_filme(filme)
    end
  end
end

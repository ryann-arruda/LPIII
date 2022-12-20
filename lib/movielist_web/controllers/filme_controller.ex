defmodule MovielistWeb.FilmeController do
  use MovielistWeb, :controller

  alias Movielist.MoviesToWatch
  alias Movielist.MoviesToWatch.Filme

  defp converter_gen_em_map([], acc), do: acc
  defp converter_gen_em_map([h | t], acc) do
    genero = MoviesToWatch.get_genero!(h.genero_id)
    acc = Map.put(acc, h.titulo, genero.nome)
    converter_gen_em_map(t, acc)
  end

  defp converter_ass_em_map([], acc), do: acc
  defp converter_ass_em_map([h | t], acc) do
    assistido = MoviesToWatch.get_assistido!(h.assistido_id)
    acc = Map.put(acc, h.titulo, assistido.confirmacao)
    converter_ass_em_map(t, acc)
  end

  def index(conn, _params) do
    filmes = MoviesToWatch.list_filmes()
    generos = converter_gen_em_map(filmes, Map.new())
    assistidos = converter_ass_em_map(filmes, Map.new())
    render(conn, "index.html", filmes: filmes, generos: generos, assistidos: assistidos)
  end

  def new(conn, _params) do
    changeset = MoviesToWatch.change_filme(%Filme{})
    generos = MoviesToWatch.list_generos()
    assistidos = MoviesToWatch.list_assistidos()
    genero = "L0f4x"
    assistido = "L0f4x"
    render(conn, "new.html", changeset: changeset, generos: generos, assistidos: assistidos, genero_f: genero, assistido_f: assistido)
  end

  def create(conn, %{"filme" => filme_params}) do
    case MoviesToWatch.create_filme(filme_params) do
      {:ok, filme} ->
        conn
        |> put_flash(:info, "Filme created successfully.")
        |> redirect(to: Routes.filme_path(conn, :show, filme))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    filme = MoviesToWatch.get_filme!(id)
    genero = MoviesToWatch.get_genero!(filme.genero_id)
    render(conn, "show.html", filme: filme, genero: genero)
  end

  def edit(conn, %{"id" => id}) do
    filme = MoviesToWatch.get_filme!(id)
    changeset = MoviesToWatch.change_filme(filme)
    generos = MoviesToWatch.list_generos()
    genero = MoviesToWatch.get_genero!(filme.genero_id)
    assistidos = MoviesToWatch.list_assistidos()
    assistido = MoviesToWatch.get_assistido!(filme.assistido_id)
    render(conn, "edit.html", filme: filme, changeset: changeset, generos: generos, assistidos: assistidos, genero_f: genero.nome, assistido_f: assistido.resposta)
  end

  def update(conn, %{"id" => id, "filme" => filme_params}) do
    filme = MoviesToWatch.get_filme!(id)

    case MoviesToWatch.update_filme(filme, filme_params) do
      {:ok, filme} ->
        conn
        |> put_flash(:info, "Filme updated successfully.")
        |> redirect(to: Routes.filme_path(conn, :show, filme))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", filme: filme, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    filme = MoviesToWatch.get_filme!(id)
    {:ok, _filme} = MoviesToWatch.delete_filme(filme)

    conn
    |> put_flash(:info, "Filme deleted successfully.")
    |> redirect(to: Routes.filme_path(conn, :index))
  end
end

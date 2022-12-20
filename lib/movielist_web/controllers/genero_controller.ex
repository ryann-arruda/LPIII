defmodule MovielistWeb.GeneroController do
  use MovielistWeb, :controller

  alias Movielist.MoviesToWatch
  alias Movielist.MoviesToWatch.Genero

  def index(conn, _params) do
    generos = MoviesToWatch.list_generos()
    render(conn, "index.html", generos: generos)
  end

  def new(conn, _params) do
    changeset = MoviesToWatch.change_genero(%Genero{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"genero" => genero_params}) do
    case MoviesToWatch.create_genero(genero_params) do
      {:ok, genero} ->
        conn
        |> put_flash(:info, "Genero created successfully.")
        |> redirect(to: Routes.genero_path(conn, :show, genero))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    genero = MoviesToWatch.get_genero!(id)
    render(conn, "show.html", genero: genero)
  end

  def edit(conn, %{"id" => id}) do
    genero = MoviesToWatch.get_genero!(id)
    changeset = MoviesToWatch.change_genero(genero)
    render(conn, "edit.html", genero: genero, changeset: changeset)
  end

  def update(conn, %{"id" => id, "genero" => genero_params}) do
    genero = MoviesToWatch.get_genero!(id)

    case MoviesToWatch.update_genero(genero, genero_params) do
      {:ok, genero} ->
        conn
        |> put_flash(:info, "Genero updated successfully.")
        |> redirect(to: Routes.genero_path(conn, :show, genero))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", genero: genero, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    genero = MoviesToWatch.get_genero!(id)
    {:ok, _genero} = MoviesToWatch.delete_genero(genero)

    conn
    |> put_flash(:info, "Genero deleted successfully.")
    |> redirect(to: Routes.genero_path(conn, :index))
  end
end

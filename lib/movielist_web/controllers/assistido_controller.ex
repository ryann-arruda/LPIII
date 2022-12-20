defmodule MovielistWeb.AssistidoController do
  use MovielistWeb, :controller

  alias Movielist.MoviesToWatch
  alias Movielist.MoviesToWatch.Assistido

  def index(conn, _params) do
    assistidos = MoviesToWatch.list_assistidos()
    render(conn, "index.html", assistidos: assistidos)
  end

  def new(conn, _params) do
    changeset = MoviesToWatch.change_assistido(%Assistido{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"assistido" => assistido_params}) do
    case MoviesToWatch.create_assistido(assistido_params) do
      {:ok, assistido} ->
        conn
        |> put_flash(:info, "Assistido created successfully.")
        |> redirect(to: Routes.assistido_path(conn, :show, assistido))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assistido = MoviesToWatch.get_assistido!(id)
    render(conn, "show.html", assistido: assistido)
  end

  def edit(conn, %{"id" => id}) do
    assistido = MoviesToWatch.get_assistido!(id)
    changeset = MoviesToWatch.change_assistido(assistido)
    render(conn, "edit.html", assistido: assistido, changeset: changeset)
  end

  def update(conn, %{"id" => id, "assistido" => assistido_params}) do
    assistido = MoviesToWatch.get_assistido!(id)

    case MoviesToWatch.update_assistido(assistido, assistido_params) do
      {:ok, assistido} ->
        conn
        |> put_flash(:info, "Assistido updated successfully.")
        |> redirect(to: Routes.assistido_path(conn, :show, assistido))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assistido: assistido, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    assistido = MoviesToWatch.get_assistido!(id)
    {:ok, _assistido} = MoviesToWatch.delete_assistido(assistido)

    conn
    |> put_flash(:info, "Assistido deleted successfully.")
    |> redirect(to: Routes.assistido_path(conn, :index))
  end
end

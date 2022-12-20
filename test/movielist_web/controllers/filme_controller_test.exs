defmodule MovielistWeb.FilmeControllerTest do
  use MovielistWeb.ConnCase

  import Movielist.MoviesToWatchFixtures

  @create_attrs %{ano: "some ano", diretor: "some diretor", duracao: "some duracao", titulo: "some titulo"}
  @update_attrs %{ano: "some updated ano", diretor: "some updated diretor", duracao: "some updated duracao", titulo: "some updated titulo"}
  @invalid_attrs %{ano: nil, diretor: nil, duracao: nil, titulo: nil}

  describe "index" do
    test "lists all filmes", %{conn: conn} do
      conn = get(conn, Routes.filme_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Filmes"
    end
  end

  describe "new filme" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.filme_path(conn, :new))
      assert html_response(conn, 200) =~ "New Filme"
    end
  end

  describe "create filme" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.filme_path(conn, :create), filme: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.filme_path(conn, :show, id)

      conn = get(conn, Routes.filme_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Filme"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.filme_path(conn, :create), filme: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Filme"
    end
  end

  describe "edit filme" do
    setup [:create_filme]

    test "renders form for editing chosen filme", %{conn: conn, filme: filme} do
      conn = get(conn, Routes.filme_path(conn, :edit, filme))
      assert html_response(conn, 200) =~ "Edit Filme"
    end
  end

  describe "update filme" do
    setup [:create_filme]

    test "redirects when data is valid", %{conn: conn, filme: filme} do
      conn = put(conn, Routes.filme_path(conn, :update, filme), filme: @update_attrs)
      assert redirected_to(conn) == Routes.filme_path(conn, :show, filme)

      conn = get(conn, Routes.filme_path(conn, :show, filme))
      assert html_response(conn, 200) =~ "some updated ano"
    end

    test "renders errors when data is invalid", %{conn: conn, filme: filme} do
      conn = put(conn, Routes.filme_path(conn, :update, filme), filme: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Filme"
    end
  end

  describe "delete filme" do
    setup [:create_filme]

    test "deletes chosen filme", %{conn: conn, filme: filme} do
      conn = delete(conn, Routes.filme_path(conn, :delete, filme))
      assert redirected_to(conn) == Routes.filme_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.filme_path(conn, :show, filme))
      end
    end
  end

  defp create_filme(_) do
    filme = filme_fixture()
    %{filme: filme}
  end
end

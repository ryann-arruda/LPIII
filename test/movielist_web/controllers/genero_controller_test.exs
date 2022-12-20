defmodule MovielistWeb.GeneroControllerTest do
  use MovielistWeb.ConnCase

  import Movielist.MoviesToWatchFixtures

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  describe "index" do
    test "lists all generos", %{conn: conn} do
      conn = get(conn, Routes.genero_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Generos"
    end
  end

  describe "new genero" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.genero_path(conn, :new))
      assert html_response(conn, 200) =~ "New Genero"
    end
  end

  describe "create genero" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.genero_path(conn, :create), genero: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.genero_path(conn, :show, id)

      conn = get(conn, Routes.genero_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Genero"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.genero_path(conn, :create), genero: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Genero"
    end
  end

  describe "edit genero" do
    setup [:create_genero]

    test "renders form for editing chosen genero", %{conn: conn, genero: genero} do
      conn = get(conn, Routes.genero_path(conn, :edit, genero))
      assert html_response(conn, 200) =~ "Edit Genero"
    end
  end

  describe "update genero" do
    setup [:create_genero]

    test "redirects when data is valid", %{conn: conn, genero: genero} do
      conn = put(conn, Routes.genero_path(conn, :update, genero), genero: @update_attrs)
      assert redirected_to(conn) == Routes.genero_path(conn, :show, genero)

      conn = get(conn, Routes.genero_path(conn, :show, genero))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, genero: genero} do
      conn = put(conn, Routes.genero_path(conn, :update, genero), genero: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Genero"
    end
  end

  describe "delete genero" do
    setup [:create_genero]

    test "deletes chosen genero", %{conn: conn, genero: genero} do
      conn = delete(conn, Routes.genero_path(conn, :delete, genero))
      assert redirected_to(conn) == Routes.genero_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.genero_path(conn, :show, genero))
      end
    end
  end

  defp create_genero(_) do
    genero = genero_fixture()
    %{genero: genero}
  end
end

defmodule MovielistWeb.AssistidoControllerTest do
  use MovielistWeb.ConnCase

  import Movielist.MoviesToWatchFixtures

  @create_attrs %{confirmacao: "some confirmacao", resposta: "some resposta"}
  @update_attrs %{confirmacao: "some updated confirmacao", resposta: "some updated resposta"}
  @invalid_attrs %{confirmacao: nil, resposta: nil}

  describe "index" do
    test "lists all assistidos", %{conn: conn} do
      conn = get(conn, Routes.assistido_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Assistidos"
    end
  end

  describe "new assistido" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.assistido_path(conn, :new))
      assert html_response(conn, 200) =~ "New Assistido"
    end
  end

  describe "create assistido" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.assistido_path(conn, :create), assistido: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.assistido_path(conn, :show, id)

      conn = get(conn, Routes.assistido_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Assistido"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.assistido_path(conn, :create), assistido: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Assistido"
    end
  end

  describe "edit assistido" do
    setup [:create_assistido]

    test "renders form for editing chosen assistido", %{conn: conn, assistido: assistido} do
      conn = get(conn, Routes.assistido_path(conn, :edit, assistido))
      assert html_response(conn, 200) =~ "Edit Assistido"
    end
  end

  describe "update assistido" do
    setup [:create_assistido]

    test "redirects when data is valid", %{conn: conn, assistido: assistido} do
      conn = put(conn, Routes.assistido_path(conn, :update, assistido), assistido: @update_attrs)
      assert redirected_to(conn) == Routes.assistido_path(conn, :show, assistido)

      conn = get(conn, Routes.assistido_path(conn, :show, assistido))
      assert html_response(conn, 200) =~ "some updated confirmacao"
    end

    test "renders errors when data is invalid", %{conn: conn, assistido: assistido} do
      conn = put(conn, Routes.assistido_path(conn, :update, assistido), assistido: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Assistido"
    end
  end

  describe "delete assistido" do
    setup [:create_assistido]

    test "deletes chosen assistido", %{conn: conn, assistido: assistido} do
      conn = delete(conn, Routes.assistido_path(conn, :delete, assistido))
      assert redirected_to(conn) == Routes.assistido_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.assistido_path(conn, :show, assistido))
      end
    end
  end

  defp create_assistido(_) do
    assistido = assistido_fixture()
    %{assistido: assistido}
  end
end

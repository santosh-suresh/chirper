defmodule ChirperWeb.PageControllerTest do
  use ChirperWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :home))
    assert html_response(conn, 200) =~ "Chirper"
    assert html_response(conn, 200) =~ "Home | Chirper"
  end

  test "GET /help", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :help))
    assert html_response(conn, 200) =~ "Help"
    assert html_response(conn, 200) =~ "Help | Chirper"
  end

  test "GET /about", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :about))
    assert html_response(conn, 200) =~ "About"
    assert html_response(conn, 200) =~ "About | Chirper"
  end

  test "GET /contact", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :contact))
    assert html_response(conn, 200) =~ "Contact"
    assert html_response(conn, 200) =~ "Contact | Chirper"
  end
end

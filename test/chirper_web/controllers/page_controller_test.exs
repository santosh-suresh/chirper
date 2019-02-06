defmodule ChirperWeb.PageControllerTest do
  use ChirperWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Chirper"
    assert html_response(conn, 200) =~ "Home | Chirper"
  end

  test "GET /help", %{conn: conn} do
    conn = get(conn, "/help")
    assert html_response(conn, 200) =~ "Help"
    assert html_response(conn, 200) =~ "Help | Chirper"
  end

  test "GET /about", %{conn: conn} do
    conn = get(conn, "/about")
    assert html_response(conn, 200) =~ "About"
    assert html_response(conn, 200) =~ "About | Chirper"
  end
end

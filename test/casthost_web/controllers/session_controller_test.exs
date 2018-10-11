defmodule CasthostWeb.SessionControllerTest do
  use CasthostWeb.ConnCase

  @login_attrs %{username: "meraj", password: "password"}
  @invalid_attrs %{username: nil, password: nil}

  setup do
    user = insert(:user)
    {:ok, conn: build_conn(), user: user}
  end

  describe "log in user" do
    test "redirects to index when login successful", %{conn: conn, user: user} do
      conn = post(conn, session_path(conn, :create), user: user)
      assert redirected_to(conn) == user_path(conn, :index)
    end

    test "renders errors when login failed", %{conn: conn} do
      conn = post(conn, user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "log out user" do
    test "redirects to home page when logout successful", %{conn: conn, user: user} do
      conn = post(conn, session_path(conn, :create), user: user)

      conn = delete(conn, session_path(conn, :delete, user.id))
      assert redirected_to(conn) == "/"
    end
  end
end

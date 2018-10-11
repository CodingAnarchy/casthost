defmodule CasthostWeb.SessionController do
  use CasthostWeb, :controller
  
  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"username" => user, "password" => password}}) do
    case Casthost.Auth.authenticate_user(user, password) do
      {:ok, user} ->
        conn
        |> Casthost.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: user_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username or password.")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Casthost.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end

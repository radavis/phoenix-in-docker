defmodule Rumbl.AuthTest do
  use Rumbl.ConnCase
  alias Rumbl.Auth

  setup %{conn: conn} do
    conn = conn
    |> bypass_through(Rumbl.Router, :browser)
    |> get("/")

    {:ok, %{conn: conn}}
  end

  test "authenticate_user/2 halts when no current_user exists", %{conn: conn} do
    conn = Auth.authenticate_user(conn, [])
    assert conn.halted
  end

  test "authenticate_user/2 continues when current_user exists", %{conn: conn} do
    conn = conn
    |> assign(:current_user, %Rumbl.User{})
    |> Auth.authenticate_user([])

    refute conn.halted
  end

  test "login/2 puts the user in the session", %{conn: conn} do
    login_conn = conn
    |> Auth.login(%Rumbl.User{id: 123})
    |> send_resp(:ok, "")

    next_conn = get(login_conn, "/")
    assert get_session(next_conn, :user_id) == 123
  end

  test "logout/1 drops the user's session", %{conn: conn} do
    logout_conn = conn
    |> put_session(:user_id, 123)
    |> Auth.logout()
    |> send_resp(:ok, "")

    next_conn = get(logout_conn, "/")
    refute get_session(next_conn, :user_id)
  end

  test "call/2 assigns current_user from session user_id", %{conn: conn} do
    # https://hexdocs.pm/plug/Plug.Conn.html#module-connection-fields
    user = insert_user()
    conn = conn
    |> put_session(:user_id, user.id)
    |> Auth.call(Repo)

    assert conn.assigns.current_user.id == user.id
  end

  test "call/2 assigns current_user to nil when no session user_id", %{conn: conn} do
    conn = Auth.call(conn, Repo)
    assert conn.assigns.current_user == nil
  end

  test "login with valid credentials", %{conn: conn} do
    conn = insert_user(%{username: "me", password: "asdf1234"})
    {:ok, conn} = 
      Auth.login_by_username_and_password(conn, "me", "asdf1234", repo: Repo)
    assert conn.assigns.current_user.id = user.id
  end

  test "login with invalid credentials", %{conn: conn} do
    insert_user(%{username: "me", password: "asdf1234"})
    assert {:error, :unauthorized, _conn} = 
      Auth.login_by_username_and_password(conn, "me", "wrong", repo: Repo)
  end

  test "login without an account", %{conn: conn} do
    assert {:error, :not_found, _conn} = 
      Auth.login_by_username_and_password(conn, "me", "asdf1234", repo: Repo)
  end
end

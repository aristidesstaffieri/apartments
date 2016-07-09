defmodule Apartments.LoggedInController do
  use Apartments.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

  def logged_in_action(conn, params) do
    user = Guardian.Plug.current_resource(conn)
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> render("error.json", message: "Authentication required")
  end

  def logout(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    claims = Guardian.Plug.claims(conn)
    Guardian.revoke!(jwt, claims)
    render "logout.json"
  end

end

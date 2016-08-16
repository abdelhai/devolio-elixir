defmodule Devolio.SessionController do
  use Devolio.Web, :controller

  alias Devolio.User
  alias Devolio.Repo


  def create(conn, %{"email" => email, "password" => password}) do

    {valid, user} = Devolio.User.valid_creds?(email, password)
    IO.inspect {valid, user}

    if valid do
      new_conn = Guardian.Plug.api_sign_in(conn, user)
      jwt = Guardian.Plug.current_token(new_conn)
      {:ok, claims} = Guardian.Plug.claims(new_conn)
      exp = Map.get(claims, "exp") |> to_string()

      new_conn
      |> put_resp_header("authorization", "Bearer #{jwt}")
      |> put_resp_header("x-expires", exp)
      |> render("user.json", user: user, jwt: jwt, exp: exp)
    else
      conn
      |> put_status(401)
      |> render "error.json", message: "Invalid creds."
    end

  end

end

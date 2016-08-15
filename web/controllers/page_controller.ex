defmodule Devolio.PageController do
  use Devolio.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def client(conn, _params) do
    conn
    |> put_layout("client.layout.html")
    |> render("client.html")
  end
end

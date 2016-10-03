defmodule Devolio.SpaceController do
  use Devolio.Web, :controller

  alias Devolio.Space

  def index(conn, _params) do
    spaces = Repo.all(Space)
    render(conn, "index.json", spaces: spaces)
  end

  def create(conn, %{"space" => space_params}) do
    IO.inspect space_params
    changeset = Space.changeset(%Space{}, space_params)

    case Repo.insert(changeset) do
      {:ok, space} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", space_path(conn, :show, space))
        |> render("show.json", space: space)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Devolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    space = Repo.get!(Space, id)
    render(conn, "show.json", space: space)
  end

  def update(conn, %{"id" => id, "space" => space_params}) do
    space = Repo.get!(Space, id)
    changeset = Space.changeset(space, space_params)

    case Repo.update(changeset) do
      {:ok, space} ->
        render(conn, "show.json", space: space)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Devolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    space = Repo.get!(Space, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(space)

    send_resp(conn, :no_content, "")
  end
end

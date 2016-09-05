defmodule Devolio.ChannelController do
  use Devolio.Web, :controller

  alias Devolio.Channel
  alias Devolio.Space

  def index(conn, _params) do
    channels = Repo.all(Channel)
    channels = Repo.preload channels, :space
    render(conn, "index.json", channels: channels)
  end

  def create(conn, %{"channel" => channel_params}) do
    space_id = channel_params["space_id"]
    space = Repo.get!(Space, space_id)
    changeset = Channel.changeset(%Channel{}, channel_params)
    changeset = Ecto.Changeset.put_assoc(changeset, :space, space)
    case Repo.insert(changeset) do
      {:ok, channel} ->
        IO.inspect channel.space
        conn
        |> put_status(:created)
        |> put_resp_header("location", channel_path(conn, :show, channel))
        |> render("show.json", channel: channel)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Devolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    channel = Repo.get!(Channel, id)
    render(conn, "show.json", channel: channel)
  end

  def update(conn, %{"id" => id, "channel" => channel_params}) do
    channel = Repo.get!(Channel, id)
    changeset = Channel.changeset(channel, channel_params)

    case Repo.update(changeset) do
      {:ok, channel} ->
        render(conn, "show.json", channel: channel)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Devolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    channel = Repo.get!(Channel, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(channel)

    send_resp(conn, :no_content, "")
  end
end

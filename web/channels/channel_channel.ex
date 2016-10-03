defmodule Devolio.ChannelChannel do
  use Phoenix.Channel
  alias Devolio.Message
  alias Devolio.User
  alias Devolio.Space
  alias Devolio.Repo
  
  def join("channel:" <> space_id, _message, socket) do
    IO.puts "somebody connected"
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body, "user" => user, "space" => space}, socket) do
    IO.puts body
    IO.puts space
    user_id = Repo.get_by(User, username: user).id
    space_id = Repo.get_by(Space, name: space).id

    changeset = Message.changeset(%Message{body: body, user_id: user_id, space_id: space_id})
    case Repo.insert(changeset) do
      {:ok, _} ->
        IO.puts "message saved"
      {:error, _} ->
        IO.puts "error, message wasnt saved"
    end

    broadcast! socket, "new_msg", %{body: body, user: user}
    {:noreply, socket}
  end

  # def handle_out("new_msg", payload, socket) do
  #   push socket, "new_msg", payload
  #   {:noreply, socket}
  # end

end

defmodule Devolio.ChannelChannel do
  use Phoenix.Channel
  
  def join("channel:general", _message, socket) do
    IO.puts "somebody connected"
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body, "user" => user}, socket) do
    IO.puts body
    broadcast! socket, "new_msg", %{body: body, user: user}
    {:noreply, socket}
  end

  # def handle_out("new_msg", payload, socket) do
  #   push socket, "new_msg", payload
  #   {:noreply, socket}
  # end

end

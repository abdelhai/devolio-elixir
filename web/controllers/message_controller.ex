defmodule Devolio.MessageController do
  use Devolio.Web, :controller

  alias Devolio.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.json", messages: messages)
  end

end

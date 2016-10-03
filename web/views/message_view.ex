defmodule Devolio.MessageView do
  use Devolio.Web, :view

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, Devolio.MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      name: message.body}
  end

end

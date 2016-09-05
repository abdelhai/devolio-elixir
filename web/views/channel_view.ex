defmodule Devolio.ChannelView do
  use Devolio.Web, :view

  def render("index.json", %{channels: channels}) do
    %{data: render_many(channels, Devolio.ChannelView, "channel.json")}
  end

  def render("show.json", %{channel: channel}) do
    %{data: render_one(channel, Devolio.ChannelView, "channel.json")}
  end

  def render("channel.json", %{channel: channel}) do
    IO.inspect channel.space
    %{id: channel.id,
      name: channel.name,
      description: channel.description,
      type: channel.type,
      space: %{id: channel.space.id, name: channel.space.name},
      # user_id: channel.user_id
    }
  end
end

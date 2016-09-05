defmodule Devolio.SpaceView do
  use Devolio.Web, :view

  def render("index.json", %{spaces: spaces}) do
    %{data: render_many(spaces, Devolio.SpaceView, "space.json")}
  end

  def render("show.json", %{space: space}) do
    %{data: render_one(space, Devolio.SpaceView, "space.json")}
  end

  def render("space.json", %{space: space}) do
    %{id: space.id,
      name: space.name}
  end
end

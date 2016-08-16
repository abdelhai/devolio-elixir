defmodule Devolio.UserView do
  use Devolio.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Devolio.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Devolio.UserView, "user.json")}
  end

  def render("user.json", %{user: user, jwt: jwt}) do
    %{id: user.id,
      email: user.email,
      username: user.username,
      jwt: jwt}
  end
end

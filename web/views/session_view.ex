defmodule Devolio.SessionView do
  use Devolio.Web, :view

  def render("user.json", %{user: user, jwt: jwt}) do
    %{id: user.id,
      email: user.email,
      username: user.username,
      jwt: jwt}
  end

  def render("error.json", %{message: message}) do
    %{errors: message}
  end
end

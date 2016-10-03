defmodule Devolio.Router do
  use Devolio.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", Devolio do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
  end

  # Other scopes may use custom stacks.
  scope "/api", Devolio do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    post "/session", SessionController, :create
    resources "/spaces", SpaceController, except: [:new, :edit]
    resources "/channels", ChannelController, except: [:new, :edit]
    get "/messages", MessageController, :index
    # delete "/session", SessionController, :logout
  end
end

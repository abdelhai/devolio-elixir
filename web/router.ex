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
  end

  scope "/", Devolio do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # react root
    scope "/!/" do
      get "/*path", PageController, :client
    end
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", Devolio do
  #   pipe_through :api
  # end
end

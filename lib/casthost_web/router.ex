defmodule CasthostWeb.Router do
  use CasthostWeb, :router

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

  pipeline :auth do
    plug Casthost.Auth.AuthAccessPipeline
  end

  scope "/", CasthostWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create]
  end

  scope "/", CasthostWeb do
    pipe_through [:browser, :auth]

    resources "/users", UserController, only: [:index, :show]
    resources "/sessions", SessionController, only: [:delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CasthostWeb do
  #   pipe_through :api
  # end
end

defmodule TodosWeb.Router do
  use TodosWeb, :router

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

  scope "/", TodosWeb do
    pipe_through :browser
    get "/", TodoController, :index

    resources "/todos", TodoController
    delete "/todo/clear_completed", TodoController, :clear_completed, as: :todo_clear_completed
    get "/todo/active", TodoController, :active, as: :active_todo
    get "/todo/completed", TodoController, :completed, as: :completed_todo
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodosWeb do
  #   pipe_through :api
  # end
end

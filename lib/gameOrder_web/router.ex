defmodule GameOrderWeb.Router do
  use GameOrderWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GameOrderWeb do
    pipe_through :api
  end
end

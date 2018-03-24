defmodule UpsertIssueWeb.Router do
  use UpsertIssueWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UpsertIssueWeb do
    pipe_through :api
  end
end

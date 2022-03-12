defmodule DynamicRouterWeb.PageController do
  use DynamicRouterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

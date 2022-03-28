defmodule DynamicRouterWeb.ArticleController do
  use DynamicRouterWeb, :controller

  def handle(conn, _params) do
    conn
    |> send_resp(200, "Article controller")
  end
end

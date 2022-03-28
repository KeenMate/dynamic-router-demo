defmodule DynamicRouterWeb.DownloadController do
  use DynamicRouterWeb, :controller

  def handle(conn, _params) do
    conn
    |> send_resp(200, "Download controller")
  end
end

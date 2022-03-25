defmodule DynamicRouterWeb.StaticController do
  use DynamicRouterWeb, :controller

  def handle(conn, %{"locale" => locale, "path" => [path]}) do
    IO.inspect(path)

    get_static_content(locale, path)

    send_resp(conn, 200, "Static content: #{locale}")
  end

  def get_static_content(locale, path) do
    IO.inspect(locale: locale, path: path)

  end
end

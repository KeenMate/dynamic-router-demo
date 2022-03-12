defmodule DynamicRouterWeb.DynamicRouter do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(%{method: method, path_info: path_info, params: params} = conn, _opts) do
    IO.inspect(method, label: "Method")
    IO.inspect(path_info, label: "Path")
    IO.inspect(params, label: "Params")

    handle_controller(conn)
  end

  def handle_controller(%{method: method, params: %{"locale" => locale} = params, path_info: [root | rest]} = conn) do
    route_to_controller(locale, root).handle(method, rest, conn, params)
  end

  def route_to_controller("en", "news"), do: NewsController
  def route_to_controller("cz", "novinky"), do: NewsController
end

# /en/news
# /en/news/static-item
# /cz/novinky/static-item
# /en/news/categories/cars/audi/novy-model
# /en/news/123/article-1
# /en/news/:id/:name
# /cz/novinky/123/clanek-1
# /en/news/cars/audi
# /en/cars/news
# /en/boats/news


# defmodule NewsController do
#   use DynamicRouterWeb, :controller

#   def handle("GET", path, conn, params) do
#     send_resp(conn, 200, "OK")

#   end

#   def article(conn, name) do
#     send_resp(conn, 200, "Clanek: #{inspect(name)}")
#   end

#   def category(conn, name) do
#     send_resp(conn, 200, "Kategorie: #{inspect(name)}")
#   end
# end

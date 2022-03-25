defmodule DynamicRouterWeb.DynamicController do
  use DynamicRouterWeb, :controller

  def handle(conn, %{"locale" => locale, "path" => path} = params) do
    case map_controller(locale, List.first(path)) do
      {controller, handler} -> apply(controller, handler, [conn, params])
      nil -> send_resp(conn, 404, "No route found")
    end
  end

  def map_controller("en", "news"), do: {DynamicRouterWeb.NewsController, :handle}
  def map_controller("cs", "novinky"), do: {DynamicRouterWeb.NewsController, :handle}
  def map_controller("cs", "o-nas"), do: {DynamicRouterWeb.StaticController, :about_us}
  def map_controller("en", "about-us"), do: {DynamicRouterWeb.StaticController, :handle}
  def map_controller(_, _), do: nil
end

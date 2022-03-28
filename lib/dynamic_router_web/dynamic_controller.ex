defmodule DynamicRouterWeb.DynamicController do
  use DynamicRouterWeb, :controller

  import DynamicRouterWeb.ControllerMapping

  alias DynamicRouter.Database.DbContext
  alias DynamicRouter.Database.Models.GetControllerItem

  def handle(conn, %{"path" => path} = params) do
    language_id = conn.private[:pluto__language_id]

    with {:ok, controller_code} <- get_controller_code(List.first(path), language_id),
         {:ok, controller} <- get_controller_module(controller_code) do
      apply(controller, :handle, [conn, params])
    else
      {:error, :no_match} -> send_resp(conn, 404, "No route found")
      err -> err
    end
  end

  def get_controller_module(controller_code) do
    case Map.get(controller_mapping(), controller_code) do
      nil -> {:error, :no_match}
      controller -> controller
    end
  end

  def get_controller_code(route, language_id) do
    case DbContext.get_controller(route, language_id) do
      {:ok, [%GetControllerItem{code: controller_code} | _]} -> {:ok, controller_code}
      {:ok, []} -> {:error, :no_match}
      err -> err
    end
  end
end

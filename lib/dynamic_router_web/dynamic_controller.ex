defmodule DynamicRouterWeb.DynamicController do
  use DynamicRouterWeb, :controller

  require Logger

  alias DynamicRouter.Database.DbContext
  alias DynamicRouter.Database.Models.GetControllerItem

  def handle(conn, %{"path" => path} = params) do
    language_id = conn.private[:pluto__language_id] |> IO.inspect(label: "Language ID")

    with {:ok, controller_code} <- get_controller_code(List.first(path), language_id) |> IO.inspect(label: "Controller code"),
         {:ok, controller} <- get_module_from_string(controller_code) |> IO.inspect(label: "Controller module") do
      apply(controller, :handle, [conn, params])
    else
      {:error, :no_match} -> send_resp(conn, 404, "No route found")
      err -> err
    end
  end

  def get_controller_code(route, language_id) do
    case DbContext.get_controller(route, language_id) |> IO.inspect(label: "Get controller") do
      {:ok, [%GetControllerItem{code: controller_code} | _]} -> {:ok, controller_code}
      {:ok, []} -> {:error, :no_match}
      err -> err
    end
  end

  @spec get_module_from_string(binary()) :: {:ok, module()} | {:error, any()}
  def get_module_from_string(module_string) do
    try do
      module = String.to_existing_atom("Elixir." <> module_string)

      {:ok, module}
    rescue

      ArgumentError ->
        Logger.error("Module #{module_string} not found")
        {:error, :no_match}
    end
  end
end

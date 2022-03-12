defmodule DynamicRouterWeb.DynamicController do
  use DynamicRouterWeb, :controller

  def handle(conn, %{"locale" => locale, "path" => path} = params) do
    case map_controller(locale, List.first(path)) do
      {controller, handler} -> apply(controller, handler, [conn, params])
      nil -> send_resp(conn, 404, "No route found")
    end
  end

  def map_controller("en", "news"), do: {DynamicRouterWeb.NewsController, :handle}
  def map_controller("cz", "novinky"), do: {DynamicRouterWeb.NewsController, :handle}
  def map_controller("cz", "o-nas"), do: {DynamicRouterWeb.StaticController, :about_us}
  def map_controller("en", "about-us"), do: {DynamicRouterWeb.StaticController, :about_us}
  def map_controller(_, _), do: nil
end

defmodule DynamicRouterWeb.NewsController do
  use DynamicRouterWeb, :controller

  def handle(conn, %{"locale" => locale, "path" => [_ | path]} = params) do
    category_path = Enum.join(path, "/") |> IO.inspect(label: "Category")

    case {is_category(locale, category_path), is_article(locale, path)} do
      {category_id, _} when category_id != nil -> category(conn, params, category_path)
      {_, article_id} when article_id != nil -> article(conn, params, category_path)
      _ -> send_resp(conn, 404, "No route found")
    end
  end

  def category(conn, params, category) do
    send_resp(conn, 200, "Category: #{category}")
  end

  def article(conn, params, article) do
    send_resp(conn, 200, "Article: #{article}")
  end

  def is_category("en", "cars"), do: true
  def is_category("en", "cars/audi"), do: true
  def is_category("cz", "auta"), do: true
  def is_category("cz", "auta/audi"), do: true
  def is_category(_, _), do: nil

  def is_article(locale, path) do
    id_one = get_article_id(locale, path, -2)
    id_two = get_article_id(locale, path, -1)

    case {id_one, id_two} do
      {id_one, _} when id_one != nil -> id_one
      {_, id_two} when id_two != nil -> id_two
      _ -> nil
    end
  end

  def get_article_id(locale, path, index) do
    {category, [article_id_str | _]} = Enum.split(path, index)

    category_id = is_category(locale, Enum.join(category, "/"))
    article_id = get_number(article_id_str)

    case {category_id, article_id} do
      {c_id, a_id} when c_id != nil and a_id != nil -> a_id
      _ -> nil
    end
  end

  def get_number(str) do
    case Integer.parse(str) do
      {id, ""} -> id
      _ -> nil
    end
  end
end

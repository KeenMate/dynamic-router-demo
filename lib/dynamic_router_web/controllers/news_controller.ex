defmodule DynamicRouterWeb.NewsController do
  use DynamicRouterWeb, :controller

  def handle(conn, %{"path" => [_ | []]} = _) do
    send_resp(conn, 200, "News list")
  end

  def handle(conn, %{"path" => [_ | path]}) do
    language_id = conn.private.pluto__language_id

    %{article_id: article_id, category_depth: category_depth} = get_article_id(path)
    category = Enum.take(path, category_depth)

    conn
    |> send_resp(200, "Language ID: #{language_id}, Article ID: #{article_id || "None"}, Category: #{category}")
  end

  defp get_article_id([]), do: %{article_id: nil, category_depth: 0}

  defp get_article_id([path | []]) do
    case get_number(path) do
      nil -> %{article_id: nil, category_depth: 0}
      id -> %{article_id: id, category_depth: 0}
    end
  end

  defp get_article_id(path) do
    reversed = Enum.reverse(path)

    first = List.first(reversed)
    second = reversed |> Enum.drop(1) |> List.first()

    case {get_number(first), get_number(second)} do
      {nil, nil} -> %{article_id: nil, category_depth: length(path)}
      {id, _} when not is_nil(id) -> %{article_id: id, category_depth: length(path) - 1}
      {_, id} -> %{article_id: id, category_depth: length(path) - 2}
    end
  end

  def get_number(str) do
    case Integer.parse(str) do
      {id, ""} -> id
      _ -> nil
    end
  end
end

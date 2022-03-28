defmodule DynamicRouterWeb.LanguagePlug do
  alias DynamicRouter.Database.Models.GetLanguageItem

  import Plug.Conn
  import DynamicRouter.Database.DbContext

  def init(opts) do
    IO.puts("Lang plug init")
    opts
  end

  def call(%{params: %{"locale" => code}} = conn, _opts) do
    IO.puts("Language plug called")

    IO.inspect(code, label: "Locale code")

    {:ok, language_id} = get_language_id(code) |> IO.inspect(label: "Language ID")

    conn
    |> put_private(:pluto__language_id, language_id)
  end

  defp get_language_id(code) do
    case get_language(code) do
      {:ok, [%GetLanguageItem{language_id: lang_id} | []]} -> {:ok, lang_id}
      {:error, _} = err -> err
    end
  end
end

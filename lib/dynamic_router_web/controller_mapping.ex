defmodule DynamicRouterWeb.ControllerMapping do
  @map %{
    "news" => DynamicRouterWeb.NewsController,
    "article" => DynamicRouterWeb.ArticleController,
    "download" => DynamicRouterWeb.DownloadController,
    "static" => DynamicRouterWeb.StaticController
  }

  def controller_mapping() do
    @map
  end
end

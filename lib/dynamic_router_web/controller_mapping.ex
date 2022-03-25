defmodule DynamicRouterWeb.ControllerMapping do
  @map %{
    "news" => DynamicRouterWeb.NewsController,
    "article" => DynamicRouterWeb.ArticleController,
    "download" => DynamicRouterWeb.DownloadController
  }

  def controller_mapping() do
    @map
  end
end

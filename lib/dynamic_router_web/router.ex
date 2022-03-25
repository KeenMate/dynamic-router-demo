defmodule DynamicRouterWeb.Router do
  use DynamicRouterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DynamicRouterWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug(SetLocale,
      gettext: DynamicRouterWeb.Gettext,
      default_locale: "en",
      cookie_key: "dynamic_router_locale",
      additional_locales: ["cz"]
    )
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DynamicRouterWeb do
    pipe_through :browser
    # you need this entry to support the default root without a locale, it will never be called
    get "/", PageController, :dummy
  end

  scope "/:locale", DynamicRouterWeb do
    pipe_through :browser
    
    get "/", PageController, :index

    get "/*path", DynamicController, :handle
  end

  # Other scopes may use custom stacks.
  # scope "/api", DynamicRouterWeb do
  #   pipe_through :api
  # end
end

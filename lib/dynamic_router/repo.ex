defmodule DynamicRouter.Repo do
  use Ecto.Repo,
    otp_app: :dynamic_router,
    adapter: Ecto.Adapters.Postgres
end

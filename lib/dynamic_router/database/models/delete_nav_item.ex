# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.DeleteNavItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :nav_id,
    :code,
    :nav_state_code,
    :title
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.DeleteNavItem{}
end
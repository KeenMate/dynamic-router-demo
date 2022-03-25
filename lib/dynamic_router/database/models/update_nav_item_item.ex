# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.UpdateNavItemItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :nav_item_id,
    :nav_id,
    :language_id,
    :nav_state,
    :nav_type,
    :node_path,
    :title,
    :url,
    :article_content_id,
    :priority
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.UpdateNavItemItem{}
end
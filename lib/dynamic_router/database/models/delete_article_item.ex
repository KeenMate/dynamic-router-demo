# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.DeleteArticleItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :article_id,
    :category_id,
    :article_type_code,
    :gallery_id,
    :article_code
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.DeleteArticleItem{}
end
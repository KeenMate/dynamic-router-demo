# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.UpdateArticleItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :category_id,
    :article_type_code,
    :gallery_id,
    :article_code,
    :language_id,
    :article_id,
    :title,
    :slug,
    :content,
    :keywords,
    :description,
    :state_code
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.UpdateArticleItem{}
end
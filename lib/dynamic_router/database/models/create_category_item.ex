# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.CreateCategoryItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :category_id,
    :language_id,
    :title,
    :slug,
    :content,
    :keywords,
    :description
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.CreateCategoryItem{}
end
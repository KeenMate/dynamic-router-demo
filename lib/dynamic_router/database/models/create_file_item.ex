# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.CreateFileItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :file_id,
    :code,
    :filename,
    :size,
    :content_type,
    :location
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.CreateFileItem{}
end
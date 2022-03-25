# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Models.ConstGetLanguageVariantsItem do
  @fields [
    :lv_id,
    :language_id,
    :is_root,
    :domain,
    :domain_redirect,
    :route_code,
    :is_default,
    :language_code
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %DynamicRouter.Database.Models.ConstGetLanguageVariantsItem{}
end
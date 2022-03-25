# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.DbContext do
  @moduledoc """
  This module contains functions for calling DB's stored procedures.

  Functions inside this module require as a first argument a pid. It is the pid of Postgrex driver process.
  """

  require Logger

  import Elixir.DynamicRouter.Repo, only: [query: 2]

  @spec const_get_language_variants() ::
          {:error, any()}
          | {:ok, [DynamicRouter.Database.Models.ConstGetLanguageVariantsItem.t()]}
  def const_get_language_variants() do
    Logger.debug("Calling stored procedure", procedure: "get_language_variants")

    query(
      "select * from const.get_language_variants()",
      []
    )
    |> DynamicRouter.Database.Parsers.ConstGetLanguageVariantsParser.parse_const_get_language_variants_result()
  end

  @spec add_gallery_photos(integer(), any()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.AddGalleryPhotosItem.t()]}
  def add_gallery_photos(gallery_id, photo_ids) do
    Logger.debug("Calling stored procedure", procedure: "add_gallery_photos")

    query(
      "select * from public.add_gallery_photos($1, $2)",
      [gallery_id, photo_ids]
    )
    |> DynamicRouter.Database.Parsers.AddGalleryPhotosParser.parse_add_gallery_photos_result()
  end

  @spec add_photo(binary(), integer(), integer(), integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.AddPhotoItem.t()]}
  def add_photo(code, width, height, file_size) do
    Logger.debug("Calling stored procedure", procedure: "add_photo")

    query(
      "select * from public.add_photo($1, $2, $3, $4)",
      [code, width, height, file_size]
    )
    |> DynamicRouter.Database.Parsers.AddPhotoParser.parse_add_photo_result()
  end

  @spec create_article(binary(), integer(), integer(), binary(), integer(), binary(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.CreateArticleItem.t()]}
  def create_article(created_by, user_id, category_id, type_code, language_id, title, content) do
    Logger.debug("Calling stored procedure", procedure: "create_article")

    query(
      "select * from public.create_article($1, $2, $3, $4, $5, $6, $7)",
      [created_by, user_id, category_id, type_code, language_id, title, content]
    )
    |> DynamicRouter.Database.Parsers.CreateArticleParser.parse_create_article_result()
  end

  @spec create_category(binary(), integer(), binary(), binary(), binary(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.CreateCategoryItem.t()]}
  def create_category(created_by, language_id, title, content, keywords, description) do
    Logger.debug("Calling stored procedure", procedure: "create_category")

    query(
      "select * from public.create_category($1, $2, $3, $4, $5, $6)",
      [created_by, language_id, title, content, keywords, description]
    )
    |> DynamicRouter.Database.Parsers.CreateCategoryParser.parse_create_category_result()
  end

  @spec create_file(integer(), binary(), integer(), binary(), integer(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.CreateFileItem.t()]}
  def create_file(user_id, created_by, comm_id, filename, size, content_type) do
    Logger.debug("Calling stored procedure", procedure: "create_file")

    query(
      "select * from public.create_file($1, $2, $3, $4, $5, $6)",
      [user_id, created_by, comm_id, filename, size, content_type]
    )
    |> DynamicRouter.Database.Parsers.CreateFileParser.parse_create_file_result()
  end

  @spec create_nav(binary(), integer(), binary(), binary(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.CreateNavItem.t()]}
  def create_nav(created_by, user_id, code, title, nav_state_code) do
    Logger.debug("Calling stored procedure", procedure: "create_nav")

    query(
      "select * from public.create_nav($1, $2, $3, $4, $5)",
      [created_by, user_id, code, title, nav_state_code]
    )
    |> DynamicRouter.Database.Parsers.CreateNavParser.parse_create_nav_result()
  end

  @spec create_nav_item(
          binary(),
          integer(),
          integer(),
          integer(),
          binary(),
          integer(),
          binary(),
          binary(),
          binary(),
          integer()
        ) :: {:error, any()} | {:ok, [DynamicRouter.Database.Models.CreateNavItemItem.t()]}
  def create_nav_item(
        created_by,
        user_id,
        nav_id,
        language_id,
        title,
        parent_item_id,
        url,
        nav_type,
        nav_state,
        priority
      ) do
    Logger.debug("Calling stored procedure", procedure: "create_nav_item")

    query(
      "select * from public.create_nav_item($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
      [
        created_by,
        user_id,
        nav_id,
        language_id,
        title,
        parent_item_id,
        url,
        nav_type,
        nav_state,
        priority
      ]
    )
    |> DynamicRouter.Database.Parsers.CreateNavItemParser.parse_create_nav_item_result()
  end

  @spec delete_article(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.DeleteArticleItem.t()]}
  def delete_article(article_id) do
    Logger.debug("Calling stored procedure", procedure: "delete_article")

    query(
      "select * from public.delete_article($1)",
      [article_id]
    )
    |> DynamicRouter.Database.Parsers.DeleteArticleParser.parse_delete_article_result()
  end

  @spec delete_category(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.DeleteCategoryItem.t()]}
  def delete_category(category_id) do
    Logger.debug("Calling stored procedure", procedure: "delete_category")

    query(
      "select * from public.delete_category($1)",
      [category_id]
    )
    |> DynamicRouter.Database.Parsers.DeleteCategoryParser.parse_delete_category_result()
  end

  @spec delete_nav(binary(), integer(), integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.DeleteNavItem.t()]}
  def delete_nav(deleted_by, user_id, nav_id) do
    Logger.debug("Calling stored procedure", procedure: "delete_nav")

    query(
      "select * from public.delete_nav($1, $2, $3)",
      [deleted_by, user_id, nav_id]
    )
    |> DynamicRouter.Database.Parsers.DeleteNavParser.parse_delete_nav_result()
  end

  @spec delete_nav_item(binary(), integer(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.DeleteNavItemItem.t()]}
  def delete_nav_item(deleted_by, user_id, nav_item_path) do
    Logger.debug("Calling stored procedure", procedure: "delete_nav_item")

    query(
      "select * from public.delete_nav_item($1, $2, $3)",
      [deleted_by, user_id, nav_item_path]
    )
    |> DynamicRouter.Database.Parsers.DeleteNavItemParser.parse_delete_nav_item_result()
  end

  @spec delete_nav_items(binary(), integer(), any()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.DeleteNavItemsItem.t()]}
  def delete_nav_items(deleted_by, user_id, nav_item_ids) do
    Logger.debug("Calling stored procedure", procedure: "delete_nav_items")

    query(
      "select * from public.delete_nav_items($1, $2, $3)",
      [deleted_by, user_id, nav_item_ids]
    )
    |> DynamicRouter.Database.Parsers.DeleteNavItemsParser.parse_delete_nav_items_result()
  end

  @spec get_all_articles() ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetAllArticlesItem.t()]}
  def get_all_articles() do
    Logger.debug("Calling stored procedure", procedure: "get_all_articles")

    query(
      "select * from public.get_all_articles()",
      []
    )
    |> DynamicRouter.Database.Parsers.GetAllArticlesParser.parse_get_all_articles_result()
  end

  @spec get_all_categories() ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetAllCategoriesItem.t()]}
  def get_all_categories() do
    Logger.debug("Calling stored procedure", procedure: "get_all_categories")

    query(
      "select * from public.get_all_categories()",
      []
    )
    |> DynamicRouter.Database.Parsers.GetAllCategoriesParser.parse_get_all_categories_result()
  end

  @spec get_all_files() :: {:error, any()} | {:ok, [binary()]}
  def get_all_files() do
    Logger.debug("Calling stored procedure", procedure: "get_all_files")

    query(
      "select * from public.get_all_files()",
      []
    )
    |> DynamicRouter.Database.Parsers.GetAllFilesParser.parse_get_all_files_result()
  end

  @spec get_all_galleries() ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetAllGalleriesItem.t()]}
  def get_all_galleries() do
    Logger.debug("Calling stored procedure", procedure: "get_all_galleries")

    query(
      "select * from public.get_all_galleries()",
      []
    )
    |> DynamicRouter.Database.Parsers.GetAllGalleriesParser.parse_get_all_galleries_result()
  end

  @spec get_all_photos() ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetAllPhotosItem.t()]}
  def get_all_photos() do
    Logger.debug("Calling stored procedure", procedure: "get_all_photos")

    query(
      "select * from public.get_all_photos()",
      []
    )
    |> DynamicRouter.Database.Parsers.GetAllPhotosParser.parse_get_all_photos_result()
  end

  @spec get_all_settings() ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetAllSettingsItem.t()]}
  def get_all_settings() do
    Logger.debug("Calling stored procedure", procedure: "get_all_settings")

    query(
      "select * from public.get_all_settings()",
      []
    )
    |> DynamicRouter.Database.Parsers.GetAllSettingsParser.parse_get_all_settings_result()
  end

  @spec get_article(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetArticleItem.t()]}
  def get_article(article_id) do
    Logger.debug("Calling stored procedure", procedure: "get_article")

    query(
      "select * from public.get_article($1)",
      [article_id]
    )
    |> DynamicRouter.Database.Parsers.GetArticleParser.parse_get_article_result()
  end

  @spec get_category(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetCategoryItem.t()]}
  def get_category(category_id) do
    Logger.debug("Calling stored procedure", procedure: "get_category")

    query(
      "select * from public.get_category($1)",
      [category_id]
    )
    |> DynamicRouter.Database.Parsers.GetCategoryParser.parse_get_category_result()
  end

  @spec get_controller(binary(), integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetControllerItem.t()]}
  def get_controller(route, language_id) do
    Logger.debug("Calling stored procedure", procedure: "get_controller")

    query(
      "select * from public.get_controller($1, $2)",
      [route, language_id]
    )
    |> DynamicRouter.Database.Parsers.GetControllerParser.parse_get_controller_result()
  end

  @spec get_gallery(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetGalleryItem.t()]}
  def get_gallery(gallery_id) do
    Logger.debug("Calling stored procedure", procedure: "get_gallery")

    query(
      "select * from public.get_gallery($1)",
      [gallery_id]
    )
    |> DynamicRouter.Database.Parsers.GetGalleryParser.parse_get_gallery_result()
  end

  @spec get_gallery_photos(binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetGalleryPhotosItem.t()]}
  def get_gallery_photos(code) do
    Logger.debug("Calling stored procedure", procedure: "get_gallery_photos")

    query(
      "select * from public.get_gallery_photos($1)",
      [code]
    )
    |> DynamicRouter.Database.Parsers.GetGalleryPhotosParser.parse_get_gallery_photos_result()
  end

  @spec get_language(binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetLanguageItem.t()]}
  def get_language(language_code) do
    Logger.debug("Calling stored procedure", procedure: "get_language")

    query(
      "select * from public.get_language($1)",
      [language_code]
    )
    |> DynamicRouter.Database.Parsers.GetLanguageParser.parse_get_language_result()
  end

  @spec get_navigation(binary(), integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetNavigationItem.t()]}
  def get_navigation(code, language_id) do
    Logger.debug("Calling stored procedure", procedure: "get_navigation")

    query(
      "select * from public.get_navigation($1, $2)",
      [code, language_id]
    )
    |> DynamicRouter.Database.Parsers.GetNavigationParser.parse_get_navigation_result()
  end

  @spec get_random_photo(binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetRandomPhotoItem.t()]}
  def get_random_photo(code) do
    Logger.debug("Calling stored procedure", procedure: "get_random_photo")

    query(
      "select * from public.get_random_photo($1)",
      [code]
    )
    |> DynamicRouter.Database.Parsers.GetRandomPhotoParser.parse_get_random_photo_result()
  end

  @spec get_top_photos(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.GetTopPhotosItem.t()]}
  def get_top_photos(how_many) do
    Logger.debug("Calling stored procedure", procedure: "get_top_photos")

    query(
      "select * from public.get_top_photos($1)",
      [how_many]
    )
    |> DynamicRouter.Database.Parsers.GetTopPhotosParser.parse_get_top_photos_result()
  end

  @spec load_initial_data() :: {:error, any()} | {:ok, [integer()]}
  def load_initial_data() do
    Logger.debug("Calling stored procedure", procedure: "load_initial_data")

    query(
      "select * from public.load_initial_data()",
      []
    )
    |> DynamicRouter.Database.Parsers.LoadInitialDataParser.parse_load_initial_data_result()
  end

  @spec remove_gallery(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.RemoveGalleryItem.t()]}
  def remove_gallery(gallery_id) do
    Logger.debug("Calling stored procedure", procedure: "remove_gallery")

    query(
      "select * from public.remove_gallery($1)",
      [gallery_id]
    )
    |> DynamicRouter.Database.Parsers.RemoveGalleryParser.parse_remove_gallery_result()
  end

  @spec remove_gallery_photos(integer(), any()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.RemoveGalleryPhotosItem.t()]}
  def remove_gallery_photos(gallery_id, photo_ids) do
    Logger.debug("Calling stored procedure", procedure: "remove_gallery_photos")

    query(
      "select * from public.remove_gallery_photos($1, $2)",
      [gallery_id, photo_ids]
    )
    |> DynamicRouter.Database.Parsers.RemoveGalleryPhotosParser.parse_remove_gallery_photos_result()
  end

  @spec remove_photo(binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.RemovePhotoItem.t()]}
  def remove_photo(code) do
    Logger.debug("Calling stored procedure", procedure: "remove_photo")

    query(
      "select * from public.remove_photo($1)",
      [code]
    )
    |> DynamicRouter.Database.Parsers.RemovePhotoParser.parse_remove_photo_result()
  end

  @spec remove_settings(integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.RemoveSettingsItem.t()]}
  def remove_settings(settings_id) do
    Logger.debug("Calling stored procedure", procedure: "remove_settings")

    query(
      "select * from public.remove_settings($1)",
      [settings_id]
    )
    |> DynamicRouter.Database.Parsers.RemoveSettingsParser.parse_remove_settings_result()
  end

  @spec save_gallery(binary(), binary(), binary(), integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.SaveGalleryItem.t()]}
  def save_gallery(code, title_cs, title_en, gallery_id) do
    Logger.debug("Calling stored procedure", procedure: "save_gallery")

    query(
      "select * from public.save_gallery($1, $2, $3, $4)",
      [code, title_cs, title_en, gallery_id]
    )
    |> DynamicRouter.Database.Parsers.SaveGalleryParser.parse_save_gallery_result()
  end

  @spec save_settings(binary(), binary(), integer()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.SaveSettingsItem.t()]}
  def save_settings(code, value, settings_id) do
    Logger.debug("Calling stored procedure", procedure: "save_settings")

    query(
      "select * from public.save_settings($1, $2, $3)",
      [code, value, settings_id]
    )
    |> DynamicRouter.Database.Parsers.SaveSettingsParser.parse_save_settings_result()
  end

  @spec set_nav_visibility(binary(), integer(), integer(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.SetNavVisibilityItem.t()]}
  def set_nav_visibility(modified_by, user_id, nav_id, nav_state_code) do
    Logger.debug("Calling stored procedure", procedure: "set_nav_visibility")

    query(
      "select * from public.set_nav_visibility($1, $2, $3, $4)",
      [modified_by, user_id, nav_id, nav_state_code]
    )
    |> DynamicRouter.Database.Parsers.SetNavVisibilityParser.parse_set_nav_visibility_result()
  end

  @spec trg_generate_code_from_title() :: {:error, any()} | {:ok, [any()]}
  def trg_generate_code_from_title() do
    Logger.debug("Calling stored procedure", procedure: "trg_generate_code_from_title")

    query(
      "select * from public.trg_generate_code_from_title()",
      []
    )
    |> DynamicRouter.Database.Parsers.TrgGenerateCodeFromTitleParser.parse_trg_generate_code_from_title_result()
  end

  @spec trg_generate_slug_from_title() :: {:error, any()} | {:ok, [any()]}
  def trg_generate_slug_from_title() do
    Logger.debug("Calling stored procedure", procedure: "trg_generate_slug_from_title")

    query(
      "select * from public.trg_generate_slug_from_title()",
      []
    )
    |> DynamicRouter.Database.Parsers.TrgGenerateSlugFromTitleParser.parse_trg_generate_slug_from_title_result()
  end

  @spec update_article(
          integer(),
          binary(),
          integer(),
          integer(),
          binary(),
          integer(),
          integer(),
          binary(),
          binary()
        ) :: {:error, any()} | {:ok, [DynamicRouter.Database.Models.UpdateArticleItem.t()]}
  def update_article(
        article_id,
        created_by,
        user_id,
        category_id,
        type_code,
        ac_id,
        language_id,
        title,
        content
      ) do
    Logger.debug("Calling stored procedure", procedure: "update_article")

    query(
      "select * from public.update_article($1, $2, $3, $4, $5, $6, $7, $8, $9)",
      [
        article_id,
        created_by,
        user_id,
        category_id,
        type_code,
        ac_id,
        language_id,
        title,
        content
      ]
    )
    |> DynamicRouter.Database.Parsers.UpdateArticleParser.parse_update_article_result()
  end

  @spec update_category(
          integer(),
          binary(),
          integer(),
          integer(),
          binary(),
          binary(),
          binary(),
          binary()
        ) :: {:error, any()} | {:ok, [DynamicRouter.Database.Models.UpdateCategoryItem.t()]}
  def update_category(
        category_id,
        created_by,
        cc_id,
        language_id,
        title,
        content,
        keywords,
        description
      ) do
    Logger.debug("Calling stored procedure", procedure: "update_category")

    query(
      "select * from public.update_category($1, $2, $3, $4, $5, $6, $7, $8)",
      [category_id, created_by, cc_id, language_id, title, content, keywords, description]
    )
    |> DynamicRouter.Database.Parsers.UpdateCategoryParser.parse_update_category_result()
  end

  @spec update_nav(binary(), integer(), integer(), binary(), binary(), binary()) ::
          {:error, any()} | {:ok, [DynamicRouter.Database.Models.UpdateNavItem.t()]}
  def update_nav(modified_by, user_id, nav_id, code, title, nav_state_code) do
    Logger.debug("Calling stored procedure", procedure: "update_nav")

    query(
      "select * from public.update_nav($1, $2, $3, $4, $5, $6)",
      [modified_by, user_id, nav_id, code, title, nav_state_code]
    )
    |> DynamicRouter.Database.Parsers.UpdateNavParser.parse_update_nav_result()
  end

  @spec update_nav_item(
          binary(),
          integer(),
          integer(),
          integer(),
          binary(),
          binary(),
          binary(),
          binary()
        ) :: {:error, any()} | {:ok, [DynamicRouter.Database.Models.UpdateNavItemItem.t()]}
  def update_nav_item(
        modified_by,
        user_id,
        nav_item_id,
        language_id,
        nav_type,
        nav_state,
        title,
        url
      ) do
    Logger.debug("Calling stored procedure", procedure: "update_nav_item")

    query(
      "select * from public.update_nav_item($1, $2, $3, $4, $5, $6, $7, $8)",
      [modified_by, user_id, nav_item_id, language_id, nav_type, nav_state, title, url]
    )
    |> DynamicRouter.Database.Parsers.UpdateNavItemParser.parse_update_nav_item_result()
  end
end
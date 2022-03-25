# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Parsers.DeleteArticleParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_delete_article_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             DynamicRouter.Database.Models.DeleteArticleItem.t()
           ]}
          | {:error, any()}
  def parse_delete_article_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "delete_article",
      reason: inspect(reason)
    )

    err
  end

  def parse_delete_article_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_delete_article_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_delete_article_result_row([
        created,
        created_by,
        modified,
        modified_by,
        article_id,
        category_id,
        article_type_code,
        gallery_id,
        article_code
      ]) do
    {
      :ok,
      %DynamicRouter.Database.Models.DeleteArticleItem{
        created: created,
        created_by: created_by,
        modified: modified,
        modified_by: modified_by,
        article_id: article_id,
        category_id: category_id,
        article_type_code: article_type_code,
        gallery_id: gallery_id,
        article_code: article_code
      }
    }
  end

  def parse_delete_article_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end
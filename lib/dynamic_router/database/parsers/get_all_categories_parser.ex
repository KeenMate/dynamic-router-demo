# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Parsers.GetAllCategoriesParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_get_all_categories_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             DynamicRouter.Database.Models.GetAllCategoriesItem.t()
           ]}
          | {:error, any()}
  def parse_get_all_categories_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "get_all_categories",
      reason: inspect(reason)
    )

    err
  end

  def parse_get_all_categories_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_get_all_categories_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_get_all_categories_result_row([
        created,
        created_by,
        modified,
        modified_by,
        category_id,
        category_content
      ]) do
    {
      :ok,
      %DynamicRouter.Database.Models.GetAllCategoriesItem{
        created: created,
        created_by: created_by,
        modified: modified,
        modified_by: modified_by,
        category_id: category_id,
        category_content: category_content
      }
    }
  end

  def parse_get_all_categories_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end
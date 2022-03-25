# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Parsers.CreateFileParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_create_file_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             DynamicRouter.Database.Models.CreateFileItem.t()
           ]}
          | {:error, any()}
  def parse_create_file_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "create_file",
      reason: inspect(reason)
    )

    err
  end

  def parse_create_file_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_create_file_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_create_file_result_row([
        created,
        created_by,
        modified,
        modified_by,
        file_id,
        code,
        filename,
        size,
        content_type,
        location
      ]) do
    {
      :ok,
      %DynamicRouter.Database.Models.CreateFileItem{
        created: created,
        created_by: created_by,
        modified: modified,
        modified_by: modified_by,
        file_id: file_id,
        code: code,
        filename: filename,
        size: size,
        content_type: content_type,
        location: location
      }
    }
  end

  def parse_create_file_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end
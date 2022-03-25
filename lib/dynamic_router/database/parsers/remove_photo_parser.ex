# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Parsers.RemovePhotoParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_remove_photo_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             DynamicRouter.Database.Models.RemovePhotoItem.t()
           ]}
          | {:error, any()}
  def parse_remove_photo_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "remove_photo",
      reason: inspect(reason)
    )

    err
  end

  def parse_remove_photo_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_remove_photo_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_remove_photo_result_row([photo_id, code, width, height, file_size]) do
    {
      :ok,
      %DynamicRouter.Database.Models.RemovePhotoItem{
        photo_id: photo_id,
        code: code,
        width: width,
        height: height,
        file_size: file_size
      }
    }
  end

  def parse_remove_photo_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end
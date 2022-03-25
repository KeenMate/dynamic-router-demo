# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Parsers.RemoveSettingsParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_remove_settings_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             DynamicRouter.Database.Models.RemoveSettingsItem.t()
           ]}
          | {:error, any()}
  def parse_remove_settings_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "remove_settings",
      reason: inspect(reason)
    )

    err
  end

  def parse_remove_settings_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_remove_settings_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_remove_settings_result_row([settings_id, code, value]) do
    {
      :ok,
      %DynamicRouter.Database.Models.RemoveSettingsItem{
        settings_id: settings_id,
        code: code,
        value: value
      }
    }
  end

  def parse_remove_settings_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end
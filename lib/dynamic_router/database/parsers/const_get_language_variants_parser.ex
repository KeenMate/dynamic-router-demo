# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule DynamicRouter.Database.Parsers.ConstGetLanguageVariantsParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_const_get_language_variants_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             DynamicRouter.Database.Models.ConstGetLanguageVariantsItem.t()
           ]}
          | {:error, any()}
  def parse_const_get_language_variants_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "const_get_language_variants",
      reason: inspect(reason)
    )

    err
  end

  def parse_const_get_language_variants_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_const_get_language_variants_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_const_get_language_variants_result_row([
        lv_id,
        language_id,
        is_root,
        domain,
        domain_redirect,
        route_code,
        is_default,
        language_code
      ]) do
    {
      :ok,
      %DynamicRouter.Database.Models.ConstGetLanguageVariantsItem{
        lv_id: lv_id,
        language_id: language_id,
        is_root: is_root,
        domain: domain,
        domain_redirect: domain_redirect,
        route_code: route_code,
        is_default: is_default,
        language_code: language_code
      }
    }
  end

  def parse_const_get_language_variants_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end
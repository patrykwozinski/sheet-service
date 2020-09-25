defmodule SheetService do
  @moduledoc """
  Mechanism that allows us to process sheets with `.csv` and `.xlsx` extensions.
  """

  @spec process(file :: String.t()) :: {:ok, [struct()]} :: {:error, String.t()}
  @doc """
  Process given path and return data
  """
  def process(file_path) do
    case SheetService.ParserLocator.find_by_extension(file_path) do
      {:ok, parser} -> parser.parse(file_path)
      {:error, :parser_not_found} -> {:error, "parser not found"}
    end
  end
end

defmodule SheetService.ParserLocator do
  @spec find_by_extension(file_path :: String.t()) ::
          {:ok, SheetService.Parser} | {:error, :parser_not_found}
  def find_by_extension(file_path) do
    case Path.extname(file_path) do
      ".csv" -> {:ok, SheetService.Parser.CsvParser}
      _ -> {:error, :parser_not_found}
    end
  end
end

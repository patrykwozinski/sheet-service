defmodule SheetService.Parser.CsvParser do
  @moduledoc false
  @behaviour SheetService.Parser

  def parse(file_path) do
    File.stream!(file_path) |> CSV.decode(separator: ?;) |> Enum.to_list()
  end
end

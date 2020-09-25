defmodule SheetService.Parser.CsvParser do
  @behaviour SheetService.Parser

  def parse(file_path) do
    {:ok,
     file_path
     |> File.stream!()
     |> Stream.map(fn row ->
       {:ok, row} = Codepagex.to_string(row |> remove_bom(), :iso_8859_1)

       row
     end)
     |> CSV.decode(separator: ?;, headers: true)
     |> Enum.to_list()}
  end

  defp remove_bom(row) do
    row |> String.replace_prefix("\uFEFF", "")
  end
end

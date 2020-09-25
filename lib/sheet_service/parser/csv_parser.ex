defmodule SheetService.Parser.CsvParser do
  @behaviour SheetService.Parser

  def parse(file_path) do
    sheet =
      file_path
      |> File.stream!()
      |> Stream.map(fn row ->
        {:ok, row} = Codepagex.to_string(row |> remove_bom(), :iso_8859_1)

        row
      end)
      |> CSV.decode(separator: ?;)

    headers =
      sheet
      |> Enum.take(1)
      |> Enum.map(fn {_, value} -> value end)
      |> List.first()
      |> SheetService.HeaderNormalizer.normalize()

    sheet
    |> Enum.drop(1)
    |> Enum.map(fn {_, value} -> value end)
    |> Enum.map(fn row ->
      Enum.zip(headers, row)
    end)
    |> Enum.map(fn row ->
      start = %{}

      row
      |> Enum.map(fn {key, field} ->
        Map.put_new(start, key, field)
      end)
      |> Enum.reduce(%{}, fn data, actual ->
        Enum.into(data, actual)
      end)
      |> Map.delete("")
    end)
  end

  defp remove_bom(row) do
    row |> String.replace_prefix("\uFEFF", "")
  end
end

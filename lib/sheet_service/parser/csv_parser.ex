defmodule SheetService.Parser.CsvParser do
  @behaviour SheetService.Parser

  def parse(file_path) do
    sheet_stream =
      file_path
      |> File.stream!([:trim_bom])
      |> Stream.map(fn row ->
        {:ok, row} = Codepagex.to_string(row, :iso_8859_1)

        row
      end)

    delimiter =
      sheet_stream
      |> CSV.decode(separator: ?\n)
      |> Enum.to_list()
      |> Enum.map(fn {_, element} ->
        element |> List.first()
      end)
      |> SheetService.Parser.Csv.GuessDelimiter.guess_delimiter()

    sheet =
      sheet_stream
      |> CSV.decode(separator: delimiter)

    headers =
      sheet
      |> Enum.take(1)
      |> strip_status()
      |> List.first()
      |> SheetService.HeaderNormalizer.normalize()

    sheet
    |> Enum.drop(1)
    |> strip_status()
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

  defp strip_status(sheet) do
    sheet |> Enum.map(fn {_, value} -> value end)
  end
end

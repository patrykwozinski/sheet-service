defmodule SheetService.Parser.XlsxParser do
  @behaviour SheetService.Parser

  def parse(file_path) do
    {:ok, document} =
      file_path
      |> XlsxReader.open()

    sheet_name =
      document
      |> XlsxReader.sheet_names()
      |> List.first()

    {:ok, sheet} = XlsxReader.sheet(document, sheet_name)

    headers =
      sheet
      |> List.first()
      |> SheetService.HeaderNormalizer.normalize()

    data =
      sheet
      |> Enum.drop(1)
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
      end)

    {:ok, data}
  end
end

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
        |> Enum.map(fn {header_field, value_field} ->
          %{header_field => value_field}
        end)
      end)

    IO.inspect(data)

    {:ok, data}
  end
end
